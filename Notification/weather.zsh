#!/bin/bash
file="/home/muhammed/Documents/CEW/OEL/weather_data.json"

# Extract and display values
latitude=$(jq -r '.latitude' "$file")
longitude=$(jq -r '.longitude' "$file")
temperature=$(jq -r '.current.temperature_2m' "$file")
humidity=$(jq -r '.current.relative_humidity_2m' "$file")
temperature_float=$(echo "scale=2; $temperature" | bc)

# Display values to the user
echo "Karachi Weather:"
echo "Latitude: $latitude°"
echo "Longitude: $longitude°"
echo "Temperature: $temperature °C"
echo "Humidity: $humidity g/m3"

# weather api is from mateo.com
#"https://api.open-meteo.com/v1/forecast?latitude=24.8608&longitude=67.0104&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,pressure_msl"

threshold_temperature_high=30
threshold_temperature_low=10
elastic_email_username="muhammedhm2002@gmail.com"
elastic_email_password="CA325460E2F14585CE016788459FF95DD659"
from_email="muhammedhm2002@gmail.com"
to_email="muhammedhasanmisba@gmail.com"

# Check if the temperature is higher than the threshold
if (( $(echo "$temperature_float > 30" | bc -l) )); then
    # Send email
    subject="High Temperature Alert"
    body="The current temperature ($temperature) is higher than the threshold ($threshold_temperature_high)."
    # Send email using sendemail and Elastic Email SMTP server
sendemail -f "$from_email" -t "$to_email" -u "$subject" -m "$body" \
    -s smtp.elasticemail.com:2525 -o tls=yes -xu "$elastic_email_username" -xp "$elastic_email_password"
    echo "Email sent."
elif (( $(echo "$temperature_float < 10" | bc -l) ));then
    subject="Low Temperature Alert"
    body="The current temperature ($temperature) is lower than the threshold ($threshold_temperature_low)."
    # Send email using sendemail and Elastic Email SMTP server
sendemail -f "$from_email" -t "$to_email" -u "$subject" -m "$body" 
    -s smtp.elasticemail.com:2525 -o tls=yes -xu "$elastic_email_username" -xp "$elastic_email_password"
    echo "Email sent."
else
    echo "Temperature is within the normal range."
fi


# Send email using sendemail and Elastic Email SMTP server
#sendemail -f "$from_email" -t "$to_email" -u "Temperature Condition" -m "the temperature is normal" \
    #-s smtp.elasticemail.com:2525 -o tls=yes -xu "$elastic_email_username" -xp "$elastic_email_password"