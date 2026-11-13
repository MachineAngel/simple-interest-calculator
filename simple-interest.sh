#!/usr/bin/env bash

read -r -p "Enter the principal amount: " principal
read -r -p "Enter the annual interest rate (%): " rate
read -r -p "Enter the time period in years: " time

number_pattern='^([0-9]+([.][0-9]+)?|[.][0-9]+)$'
for value in "$principal" "$rate" "$time"; do
  if [[ ! $value =~ $number_pattern ]]; then
    printf 'Please enter a nonnegative number for each field.\n' >&2
    exit 1
  fi
done

awk -v principal="$principal" -v rate="$rate" -v time="$time" \
  'BEGIN { printf "Simple interest: %.2f\n", principal * rate * time / 100 }'
