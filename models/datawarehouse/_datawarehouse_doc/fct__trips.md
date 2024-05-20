-- Documentation of the datawarehouse trips table
-- Fields description

{% docs fct__trips %}

Fact table of High Volume FHV trips. More description...

{% enddocs %}


{% docs total_cost_to_passenger %}

Total amount in USD for passenger to pay. including:
- base_passenger_fare
- tolls
- bcf
- sales_tax
- congestion_surcharge
- airport_fee

Mode: Nullable

{% enddocs %}