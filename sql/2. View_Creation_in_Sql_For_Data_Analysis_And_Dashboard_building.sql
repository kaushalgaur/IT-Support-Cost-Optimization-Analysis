-- =================================================
-- 2. Creating View for Data Analysis in SQL And Power BI Dashboard
-- =================================================
Create or replace view db.ticket_kpis as
select
	ticket_id,
    issue_category,
    priority,
    client_type,
    
    coalesce(
		resolution_time_hours,
        avg(resolution_time_hours) over (partition by priority)
    )as resolution_time_hours,
    
   coalesce(
		engineer_hourly_cost,
        avg(engineer_hourly_cost) over (partition by priority)
    ) as engineer_hourly_cost, 
    
    coalesce(
		engineer_hours_spent,
        avg(engineer_hours_spent) over (partition by priority)
    )as engineer_hours_spent,
    
    coalesce(
		escalation_count,
        round(avg(escalation_count) over (partition by priority))
    )as escalation_count,
    
    coalesce(
		customer_satisfaction_score,
        avg(customer_satisfaction_score) over (partition by priority)
    )as customer_satisfaction_score,
    
    round(
		coalesce(engineer_hourly_cost, avg(engineer_hourly_cost) over (partition by priority))
        *
		coalesce(engineer_hours_spent, avg(engineer_hours_spent) over (partition by priority)),
        2
	) as total_support_cost,
    
    case
		when coalesce(escalation_count,0)>0 then 'Escalated'
        else 'Not Escalated'
	end as escalation_status,
    
    case 
		when coalesce(customer_satisfaction_score,0)>= 4.2 then "target met"
        else 'Below Target'
	end as csat_status,
    
    case 
		when coalesce(resolution_time_hours,0)<=4 then 'Fast'
        when coalesce(resolution_time_hours,0)<=12 then 'moderate'
        else 'Slow'
	end as resolution_speed
from tickets;

-- checking view 
select * from ticket_kpis
limit 10;
