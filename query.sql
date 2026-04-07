Select
	Count(*) AS total_deals,
    Sum(close_value) as total_revenue
From crm_sales_pipeline_analysis

Select *
From crm_sales_pipeline_analysis
Where deal_stage = 'won';

Select
	Count(Case When deal_stage = 'won' Then 1 end) * 1 / Count(*) AS win_rate
From crm_sales_pipeline_analysis

Select
	Avg(close_value) as avg_deal_size
From crm_sales_pipeline_analysis
Where deal_stage = 'Won';

Select
	sales_agent,
    Sum(close_value) as Revenue
From crm_sales_pipeline_analysis
Where deal_stage = 'won'
Group By sales_agent
order by Revenue Desc

Select
	deal_stage,
    Count(*) AS num_deals
From crm_sales_pipeline_analysis
Group by deal_stage
Order by num_deals Desc;

Select
	Date_Trunc('month', close_date) as month,
    Sum(close_value) as revenue
From crm_sales_pipeline_analysis
Where deal_stage = 'Won'
Group by month
Order by month;

Select
	deal_stage,
    Count(*) AS deals,
    Round(Count(*)*100 / Sum(Count(*)) OVER (), 2) AS percentage
From crm_sales_pipeline_analysis
Group By deal_stage;
