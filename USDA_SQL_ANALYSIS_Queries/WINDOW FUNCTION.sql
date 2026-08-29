

with new as (select cheese_production.Year,cheese_production.Value, state_lookup.State,

DENSE_RANK() over(partition by year order by Value DESC) as Rank_

FROM cheese_production INNER JOIN state_lookup
ON cheese_production.State_ANSI = state_lookup.State_ANSI



where Period = 'year')

select * from new
where Rank_ in (1,2,3)
ORDER BY Year DESC









