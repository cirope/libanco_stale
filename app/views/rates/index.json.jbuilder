rates.each { |rate| json.set! rate.payments_count, rate.coefficient }
