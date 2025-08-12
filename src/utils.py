from datetime import datetime, timedelta
from crud import Connector

assets = {'Banco do Brasil': 'BBAS3', 'Marfrig': 'MRFG3', 'SLC Agrícola': 'SLCE3'}

initial_date = '2025-07-11'
final_date = '2025-08-11'

def generate_list_of_dates():
    date_list = []
    current_date = datetime.strptime(initial_date, '%Y-%m-%d')
    end_date = datetime.strptime(final_date, '%Y-%m-%d')

    while current_date <= end_date:
        date_list.append(current_date.strftime('%Y-%m-%d'))
        current_date += timedelta(days=1)

    return date_list


def find_nearest_data(date, data_list, emotion_or_prices):
    if emotion_or_prices not in ['emotion', 'prices']:
        raise ValueError("Invalid emotion_or_prices value. Must be 'emotion' or 'prices' (logically).")
    
    if date == initial_date:
        nearest_data = 'neutral' if emotion_or_prices == 'emotion' else [data_list[0][1], data_list[0][2]]
    elif date == final_date:
        nearest_data = data_list[-1][1] if emotion_or_prices == 'emotion' else [data_list[-1][1], data_list[-1][2]]
    else:
        date_formated = datetime.strptime(date, '%Y-%m-%d')
        smallest_diff = date_formated - datetime.strptime(initial_date, '%Y-%m-%d')

        nearest_data = data_list[0][1] if emotion_or_prices == 'emotion' else [data_list[0][1], data_list[0][2]]

        for data in data_list:
            datas_formated_date = datetime.combine(data[0], datetime.min.time())
            current_diff = date_formated - datas_formated_date
            correct_date = datas_formated_date

            if current_diff < timedelta(0):
                break

            if current_diff < smallest_diff:
                smallest_diff = current_diff
                nearest_data = data[1] if emotion_or_prices == 'emotion' else [data[1], data[2]]
                correct_date = datas_formated_date

        if emotion_or_prices == 'prices':
            for data in data_list:
                if datetime.combine(data[0], datetime.min.time()) == correct_date and data[2] != nearest_data[1]:
                    nearest_data.append(data[1])
                    nearest_data.append(data[2])
                    break

    return nearest_data


def fill_blank_days(emotion_or_prices):
    if emotion_or_prices not in ['emotion', 'prices']:
        raise ValueError("Invalid emotion_or_prices value. Must be 'emotion' or 'prices' (logically).")

    date_list = generate_list_of_dates()
    connector = Connector()

    for assetName in assets.keys():
        print(f"Preenchendo lacunas para {assetName}, {emotion_or_prices}...")
        data = connector.read_emotions_and_date(assetName) if emotion_or_prices == 'emotion' else connector.read_asset_history(assetName)

        for date in date_list:
            if date not in [datetime.strftime(item[0], '%Y-%m-%d') for item in data]:
                print(f"Data {date} não encontrada, preenchendo com o mais próximo...")
                nearest_data = find_nearest_data(date, data, emotion_or_prices)
                if emotion_or_prices == 'emotion':
                    connector.insert_news("Preenchimento de lacuna", date, nearest_data, assetName)
                else:
                    connector.insert_price(date, nearest_data[2], nearest_data[3], assetName)
                    connector.insert_price(date, nearest_data[0], nearest_data[1], assetName)