from datetime import date

def date_format(event, context):
    date_today = date.today()
    current_date = date_today.strftime("%d/%m/%Y")
    print("**********************Today's Date*********************")
    print("**********************{0}*********************".format(current_date))
