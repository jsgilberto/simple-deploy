# Get absolute path of this script
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

# Inventory file path
FILE="${SCRIPTPATH}/inventory"

if test -f "$FILE"; then
    echo "$FILE exists."
    echo "Removing existing inventory file: rm ${FILE}"
    rm $FILE
fi

echo "Creating new inventory file located in: ${FILE}" 
echo "[all]" >> $FILE
AWS_RESPONSE=$(aws ec2 describe-instances \
                --query 'Reservations[*].Instances[*].PublicIpAddress' \
                --filters "Name=tag:name,Values=simple-deploy" \
                --output text
              )
echo "AWS response: ${AWS_RESPONSE}"

if [[ $? -ne 0 ]] || [[ -z "$AWS_RESPONSE" ]]; then
    # There was no response, so no such instance.
    echo "No instances found. Exiting with error code 1."
    return 1
fi

echo "Appending AWS response to ${FILE}"
echo $AWS_RESPONSE >> $FILE
