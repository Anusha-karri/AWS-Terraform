import boto3
import csv

dynamodb = boto3.resource('dynamodb', 'us-east-1')

def batch_data(table_name, rows):
    table = dynamodb.Table(table_name)

    with table.batch_writer() as batch:
        for row in rows:
            batch.put_item(Item=row)
    return True

def read_csv(csv_file, items):
    rows = csv.DictReader(open(csv_file))
    for row in rows:
        items.append(row)
    return items

if __name__ == '__main__':
    table_name = 'DynamoDB-tf-batch'
    file_name = 'color_srgb.csv'
    items = []

    test = read_csv(file_name, items)
    status = batch_data(table_name, items)

    if(status):
        print("Data is saved")
    else:
        print("Error while inserting")

