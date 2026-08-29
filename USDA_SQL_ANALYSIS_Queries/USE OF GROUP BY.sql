--SELECT * FROM honey_production
	--WHERE State_ANSI is Null
select coalesce (state_lookup.State,'No_state') as state_name, sum(honey_production.Value) as Total_production
from honey_production left join state_lookup
on honey_production.State_ANSI = state_lookup.State_ANSI

group by state_lookup.State
ORDER BY state_name ASC;
