-- 1. Data quality / missing values
select distinct issue_category from tickets;
/*
output : 
Software
Hardware
Access
Security
Network
*/

select distinct client_type from tickets;
/*
output : 
Medium
Small
Enterprise
*/

select distinct priority from tickets;
/*
output : 
Critical
High
Medium
Low
*/

select 
	count(*) as total_tickets,
    sum(resolution_time_hours is null) as missing_resol_time,
    sum(engineer_hourly_cost is null) as missing_hourly_cst,
    sum(engineer_hours_spent is null) as missing_engineer_hours,
    sum(escalation_count is null) as missing_escalations,
    sum(customer_satisfaction_score is null) as missing_csat_score
from tickets;

/*
total_tickets : 50000,
missing_resol_time: 5000,
missing_hourly_cst: 3846,
missing_engineer_hours: 4545,
missing_escalations: 3571
missing_csat_score: 5000
*/

-- For Analysis : Earlier we created a view for further analysis. 

-- 2. Overall KPI validation
select 
	count(*) as total_tickets,
    round(sum(total_support_cost),2) as total_support_cost,
    round(avg(total_support_cost),2) as avg_cst_per_ticket,
    round(avg(resolution_time_hours),2) as avg_resolution_time_hours,
    round(avg(customer_satisfaction_score),2) as avg_cust_satisfaction,
    round(100 * sum(escalation_count > 0) / count(*), 2) as escalation_rate_percent
from db.ticket_kpis;

-- 3. Cost reduction opportunity
select 
	issue_category,
    count(*) as total_tickets,
    round(sum(total_support_cost),2) as total_cost,
    round(avg(total_support_cost),2) as avg_cost_per_ticket,
    round(sum(engineer_hours_spent),2) as total_engr_hours
from db.ticket_kpis
group by issue_category
order by total_cost desc;

-- 4. CSAT and resolution relationship
select 
	resolution_speed,
    count(*) as total_tickets,
    round(avg(customer_satisfaction_score),2) as avg_csat,
    round(avg(escalation_count),2) as avg_escalations
from db.ticket_kpis
group by resolution_speed
order by field(resolution_speed,'fast','Moderate','slow');
    
-- 5. Unnecessary escalation analysis
select 
	priority,
    issue_category,
    count(*) as escalated_tickets,
    sum(escalation_count) as total_escalations
from db.ticket_kpis
where priority in ('low','Medium')
	and escalation_count > 0 
group by priority,issue_category
order by total_escalations desc;

-- 6. Engineer allocation workload
select 
	issue_category,
    count(*) as total_tickets,
    round(sum(engineer_hours_spent),2) as total_engr_hours,
    round(avg(engineer_hours_spent),2) as avg_engineer_hours_per_ticket,
    round(avg(resolution_time_hours),2) as avg_resolution_time
from db.ticket_kpis
group by issue_category
order by total_engr_hours desc;
