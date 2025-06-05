# 🇧🇷 Business Intelligence com SQL Avançado | 🇺🇸 Advanced SQL Business Intelligence

<div align="center">

![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Tableau](https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=tableau&logoColor=white)
![Apache Superset](https://img.shields.io/badge/Apache%20Superset-20A6C9?style=for-the-badge&logo=apache&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

**Plataforma completa de Business Intelligence com SQL avançado, dashboards interativos e análises empresariais**

[📊 Dashboards](#-dashboards-implementados) • [📈 KPIs](#-kpis-e-métricas) • [⚡ Setup](#-setup-rápido) • [🎯 Casos de Uso](#-casos-de-uso)

</div>

---

## 🇧🇷 Português

### 📊 Visão Geral

Plataforma abrangente de **Business Intelligence** desenvolvida com SQL avançado e ferramentas modernas de visualização:

- 📈 **Dashboards Executivos**: KPIs estratégicos e métricas de negócio
- 🔍 **Análises Avançadas**: Cohort, RFM, forecasting, análise de tendências
- 📊 **Visualizações Interativas**: Power BI, Tableau, Apache Superset
- 🎯 **Self-Service BI**: Ferramentas para usuários não-técnicos
- 📋 **Relatórios Automatizados**: Geração automática de relatórios
- 🔄 **ETL Inteligente**: Pipelines de dados otimizados

### 🎯 Objetivos da Plataforma

- **Democratizar acesso** a dados e insights
- **Acelerar tomada de decisão** com dados em tempo real
- **Padronizar métricas** e definições de negócio
- **Automatizar relatórios** operacionais e estratégicos
- **Facilitar análises** self-service para usuários

### 🛠️ Stack Tecnológico

#### Database e Analytics
- **PostgreSQL**: Database principal para analytics
- **ClickHouse**: Database colunar para OLAP
- **Amazon Redshift**: Data warehouse na nuvem
- **Apache Drill**: Query engine para múltiplas fontes

#### Visualização e BI
- **Apache Superset**: Plataforma BI open-source
- **Power BI**: Dashboards corporativos Microsoft
- **Tableau**: Visualizações avançadas
- **Grafana**: Monitoramento e métricas operacionais

#### Processamento e ETL
- **Apache Airflow**: Orquestração de workflows
- **dbt**: Transformações SQL como código
- **Pandas**: Processamento de dados em Python
- **Apache Spark**: Processamento distribuído

#### APIs e Integração
- **FastAPI**: APIs para dados e métricas
- **SQLAlchemy**: ORM para Python
- **Celery**: Processamento assíncrono
- **Redis**: Cache e message broker

### 📋 Estrutura da Plataforma

```
sql-business-intelligence/
├── 📁 sql/                        # Queries SQL organizadas
│   ├── 📁 kpis/                   # KPIs e métricas principais
│   │   ├── 📄 financial_kpis.sql  # KPIs financeiros
│   │   ├── 📄 sales_kpis.sql      # KPIs de vendas
│   │   ├── 📄 customer_kpis.sql   # KPIs de clientes
│   │   ├── 📄 operational_kpis.sql # KPIs operacionais
│   │   └── 📄 marketing_kpis.sql  # KPIs de marketing
│   ├── 📁 analytics/              # Análises avançadas
│   │   ├── 📄 cohort_analysis.sql # Análise de coorte
│   │   ├── 📄 rfm_analysis.sql    # Análise RFM
│   │   ├── 📄 customer_lifetime_value.sql # CLV
│   │   ├── 📄 churn_analysis.sql  # Análise de churn
│   │   ├── 📄 market_basket.sql   # Market basket analysis
│   │   └── 📄 trend_analysis.sql  # Análise de tendências
│   ├── 📁 forecasting/            # Modelos de previsão
│   │   ├── 📄 sales_forecast.sql  # Previsão de vendas
│   │   ├── 📄 demand_forecast.sql # Previsão de demanda
│   │   ├── 📄 revenue_forecast.sql # Previsão de receita
│   │   └── 📄 seasonal_analysis.sql # Análise sazonal
│   ├── 📁 executive/              # Relatórios executivos
│   │   ├── 📄 executive_summary.sql # Resumo executivo
│   │   ├── 📄 board_report.sql    # Relatório para diretoria
│   │   ├── 📄 monthly_review.sql  # Revisão mensal
│   │   └── 📄 quarterly_analysis.sql # Análise trimestral
│   ├── 📁 operational/            # Relatórios operacionais
│   │   ├── 📄 daily_operations.sql # Operações diárias
│   │   ├── 📄 inventory_report.sql # Relatório de estoque
│   │   ├── 📄 performance_metrics.sql # Métricas de performance
│   │   └── 📄 quality_metrics.sql # Métricas de qualidade
│   └── 📁 adhoc/                  # Análises ad-hoc
│       ├── 📄 campaign_analysis.sql # Análise de campanhas
│       ├── 📄 product_analysis.sql # Análise de produtos
│       ├── 📄 regional_analysis.sql # Análise regional
│       └── 📄 competitive_analysis.sql # Análise competitiva
├── 📁 dashboards/                 # Dashboards e visualizações
│   ├── 📁 superset/              # Dashboards Apache Superset
│   │   ├── 📄 executive_dashboard.json # Dashboard executivo
│   │   ├── 📄 sales_dashboard.json # Dashboard de vendas
│   │   ├── 📄 customer_dashboard.json # Dashboard de clientes
│   │   ├── 📄 financial_dashboard.json # Dashboard financeiro
│   │   └── 📄 operational_dashboard.json # Dashboard operacional
│   ├── 📁 powerbi/               # Relatórios Power BI
│   │   ├── 📄 executive_report.pbix # Relatório executivo
│   │   ├── 📄 sales_analysis.pbix # Análise de vendas
│   │   ├── 📄 customer_insights.pbix # Insights de clientes
│   │   └── 📄 financial_analysis.pbix # Análise financeira
│   ├── 📁 tableau/               # Workbooks Tableau
│   │   ├── 📄 executive_overview.twbx # Visão executiva
│   │   ├── 📄 sales_performance.twbx # Performance de vendas
│   │   └── 📄 customer_analytics.twbx # Analytics de clientes
│   └── 📁 grafana/               # Dashboards Grafana
│       ├── 📄 operational_metrics.json # Métricas operacionais
│       ├── 📄 system_monitoring.json # Monitoramento de sistema
│       └── 📄 business_metrics.json # Métricas de negócio
├── 📁 python/                     # Scripts Python para BI
│   ├── 📁 etl/                    # Scripts ETL
│   │   ├── 📄 data_extraction.py  # Extração de dados
│   │   ├── 📄 data_transformation.py # Transformação
│   │   ├── 📄 data_loading.py     # Carregamento
│   │   └── 📄 data_validation.py  # Validação de dados
│   ├── 📁 analytics/              # Analytics em Python
│   │   ├── 📄 statistical_analysis.py # Análise estatística
│   │   ├── 📄 predictive_models.py # Modelos preditivos
│   │   ├── 📄 clustering_analysis.py # Análise de clusters
│   │   └── 📄 time_series_analysis.py # Análise temporal
│   ├── 📁 automation/             # Automação de relatórios
│   │   ├── 📄 report_generator.py # Gerador de relatórios
│   │   ├── 📄 email_sender.py     # Envio de emails
│   │   ├── 📄 scheduler.py        # Agendador de tarefas
│   │   └── 📄 alert_system.py     # Sistema de alertas
│   ├── 📁 api/                    # APIs para BI
│   │   ├── 📄 main.py             # API principal
│   │   ├── 📄 kpi_endpoints.py    # Endpoints de KPIs
│   │   ├── 📄 dashboard_api.py    # API para dashboards
│   │   └── 📄 data_api.py         # API de dados
│   └── 📁 utils/                  # Utilitários
│       ├── 📄 database_utils.py   # Utilitários de banco
│       ├── 📄 visualization_utils.py # Utilitários de visualização
│       ├── 📄 export_utils.py     # Utilitários de exportação
│       └── 📄 cache_utils.py      # Utilitários de cache
├── 📁 data_models/                # Modelos de dados
│   ├── 📁 dimensional/            # Modelos dimensionais
│   │   ├── 📄 dim_customer.sql    # Dimensão cliente
│   │   ├── 📄 dim_product.sql     # Dimensão produto
│   │   ├── 📄 dim_date.sql        # Dimensão data
│   │   ├── 📄 fact_sales.sql      # Fato vendas
│   │   └── 📄 fact_financial.sql  # Fato financeiro
│   ├── 📁 aggregated/             # Tabelas agregadas
│   │   ├── 📄 daily_sales_agg.sql # Agregação diária vendas
│   │   ├── 📄 monthly_kpis_agg.sql # Agregação mensal KPIs
│   │   └── 📄 customer_metrics_agg.sql # Métricas de clientes
│   └── 📁 views/                  # Views analíticas
│       ├── 📄 customer_360_view.sql # Visão 360 do cliente
│       ├── 📄 product_performance_view.sql # Performance produtos
│       └── 📄 financial_summary_view.sql # Resumo financeiro
├── 📁 reports/                    # Templates de relatórios
│   ├── 📁 executive/              # Relatórios executivos
│   │   ├── 📄 monthly_board_report.md # Relatório mensal diretoria
│   │   ├── 📄 quarterly_review.md # Revisão trimestral
│   │   └── 📄 annual_summary.md   # Resumo anual
│   ├── 📁 operational/            # Relatórios operacionais
│   │   ├── 📄 daily_operations.md # Operações diárias
│   │   ├── 📄 weekly_performance.md # Performance semanal
│   │   └── 📄 monthly_metrics.md  # Métricas mensais
│   └── 📁 analytical/             # Relatórios analíticos
│       ├── 📄 customer_analysis.md # Análise de clientes
│       ├── 📄 product_analysis.md # Análise de produtos
│       └── 📄 market_analysis.md  # Análise de mercado
├── 📁 notebooks/                  # Jupyter notebooks
│   ├── 📄 01_data_exploration.ipynb # Exploração de dados
│   ├── 📄 02_kpi_development.ipynb # Desenvolvimento de KPIs
│   ├── 📄 03_dashboard_prototyping.ipynb # Prototipagem dashboards
│   ├── 📄 04_advanced_analytics.ipynb # Analytics avançado
│   └── 📄 05_predictive_modeling.ipynb # Modelagem preditiva
├── 📁 configs/                    # Configurações
│   ├── 📄 database_config.yaml    # Configuração de bancos
│   ├── 📄 dashboard_config.yaml   # Configuração dashboards
│   ├── 📄 kpi_definitions.yaml    # Definições de KPIs
│   └── 📄 alert_config.yaml       # Configuração de alertas
├── 📁 docker/                     # Containers Docker
│   ├── 📄 Dockerfile.superset     # Container Superset
│   ├── 📄 Dockerfile.api          # Container API
│   └── 📄 docker-compose.yml      # Orquestração completa
├── 📁 tests/                      # Testes
│   ├── 📄 test_sql_queries.py     # Testes queries SQL
│   ├── 📄 test_kpis.py            # Testes KPIs
│   └── 📄 test_api.py             # Testes API
├── 📄 requirements.txt            # Dependências Python
├── 📄 README.md                   # Este arquivo
├── 📄 LICENSE                     # Licença MIT
└── 📄 .gitignore                 # Arquivos ignorados
```

### 📊 Dashboards Implementados

#### 1. 📈 Dashboard Executivo

**KPIs Estratégicos**
```sql
-- Dashboard Executivo - KPIs Principais
WITH financial_metrics AS (
    SELECT 
        DATE_TRUNC('month', order_date) AS month,
        SUM(total_amount) AS revenue,
        SUM(total_amount - cost_amount) AS gross_profit,
        COUNT(DISTINCT order_id) AS total_orders,
        COUNT(DISTINCT customer_id) AS active_customers,
        AVG(total_amount) AS avg_order_value
    FROM fact_sales fs
    JOIN dim_date dd ON fs.date_key = dd.date_key
    WHERE order_date >= CURRENT_DATE - INTERVAL '24 months'
    GROUP BY DATE_TRUNC('month', order_date)
),
growth_metrics AS (
    SELECT 
        month,
        revenue,
        gross_profit,
        total_orders,
        active_customers,
        avg_order_value,
        -- Crescimento mês a mês
        LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
        LAG(gross_profit) OVER (ORDER BY month) AS prev_month_profit,
        LAG(active_customers) OVER (ORDER BY month) AS prev_month_customers,
        -- Crescimento ano a ano
        LAG(revenue, 12) OVER (ORDER BY month) AS prev_year_revenue,
        LAG(gross_profit, 12) OVER (ORDER BY month) AS prev_year_profit
    FROM financial_metrics
),
kpi_dashboard AS (
    SELECT 
        month,
        revenue,
        gross_profit,
        ROUND(100.0 * gross_profit / revenue, 2) AS gross_margin_pct,
        total_orders,
        active_customers,
        ROUND(avg_order_value, 2) AS avg_order_value,
        
        -- Crescimento MoM
        CASE 
            WHEN prev_month_revenue > 0 THEN
                ROUND(100.0 * (revenue - prev_month_revenue) / prev_month_revenue, 2)
            ELSE NULL
        END AS revenue_growth_mom,
        
        CASE 
            WHEN prev_month_customers > 0 THEN
                ROUND(100.0 * (active_customers - prev_month_customers) / prev_month_customers, 2)
            ELSE NULL
        END AS customer_growth_mom,
        
        -- Crescimento YoY
        CASE 
            WHEN prev_year_revenue > 0 THEN
                ROUND(100.0 * (revenue - prev_year_revenue) / prev_year_revenue, 2)
            ELSE NULL
        END AS revenue_growth_yoy,
        
        -- Métricas acumuladas
        SUM(revenue) OVER (ORDER BY month ROWS UNBOUNDED PRECEDING) AS cumulative_revenue,
        SUM(gross_profit) OVER (ORDER BY month ROWS UNBOUNDED PRECEDING) AS cumulative_profit
    FROM growth_metrics
)
SELECT 
    month,
    revenue,
    gross_profit,
    gross_margin_pct,
    total_orders,
    active_customers,
    avg_order_value,
    revenue_growth_mom,
    customer_growth_mom,
    revenue_growth_yoy,
    cumulative_revenue,
    cumulative_profit,
    
    -- Indicadores de performance
    CASE 
        WHEN revenue_growth_mom >= 10 THEN '🟢 Excelente'
        WHEN revenue_growth_mom >= 5 THEN '🟡 Bom'
        WHEN revenue_growth_mom >= 0 THEN '🟠 Moderado'
        ELSE '🔴 Atenção'
    END AS revenue_performance,
    
    CASE 
        WHEN gross_margin_pct >= 40 THEN '🟢 Saudável'
        WHEN gross_margin_pct >= 25 THEN '🟡 Aceitável'
        ELSE '🔴 Baixa'
    END AS margin_health
FROM kpi_dashboard
ORDER BY month DESC;
```

**Scorecard Executivo**
```sql
-- Scorecard Executivo - Métricas Atuais vs Metas
WITH current_month_metrics AS (
    SELECT 
        SUM(total_amount) AS current_revenue,
        SUM(total_amount - cost_amount) AS current_profit,
        COUNT(DISTINCT order_id) AS current_orders,
        COUNT(DISTINCT customer_id) AS current_customers,
        AVG(total_amount) AS current_aov
    FROM fact_sales fs
    JOIN dim_date dd ON fs.date_key = dd.date_key
    WHERE DATE_TRUNC('month', order_date) = DATE_TRUNC('month', CURRENT_DATE)
),
targets AS (
    SELECT 
        5000000 AS revenue_target,    -- Meta de receita mensal
        2000000 AS profit_target,     -- Meta de lucro mensal
        10000 AS orders_target,       -- Meta de pedidos mensais
        3000 AS customers_target,     -- Meta de clientes ativos
        500 AS aov_target            -- Meta de ticket médio
),
scorecard AS (
    SELECT 
        -- Métricas atuais
        current_revenue,
        current_profit,
        current_orders,
        current_customers,
        current_aov,
        
        -- Metas
        revenue_target,
        profit_target,
        orders_target,
        customers_target,
        aov_target,
        
        -- Performance vs Meta
        ROUND(100.0 * current_revenue / revenue_target, 1) AS revenue_vs_target_pct,
        ROUND(100.0 * current_profit / profit_target, 1) AS profit_vs_target_pct,
        ROUND(100.0 * current_orders / orders_target, 1) AS orders_vs_target_pct,
        ROUND(100.0 * current_customers / customers_target, 1) AS customers_vs_target_pct,
        ROUND(100.0 * current_aov / aov_target, 1) AS aov_vs_target_pct
    FROM current_month_metrics, targets
)
SELECT 
    *,
    -- Status indicators
    CASE 
        WHEN revenue_vs_target_pct >= 100 THEN '✅ Meta Atingida'
        WHEN revenue_vs_target_pct >= 90 THEN '🟡 Próximo da Meta'
        WHEN revenue_vs_target_pct >= 75 THEN '🟠 Abaixo da Meta'
        ELSE '🔴 Muito Abaixo'
    END AS revenue_status,
    
    CASE 
        WHEN profit_vs_target_pct >= 100 THEN '✅ Meta Atingida'
        WHEN profit_vs_target_pct >= 90 THEN '🟡 Próximo da Meta'
        WHEN profit_vs_target_pct >= 75 THEN '🟠 Abaixo da Meta'
        ELSE '🔴 Muito Abaixo'
    END AS profit_status
FROM scorecard;
```

#### 2. 🛍️ Dashboard de Vendas

**Análise de Performance de Vendas**
```sql
-- Dashboard de Vendas - Análise Detalhada
WITH sales_performance AS (
    SELECT 
        dp.category,
        dp.subcategory,
        dp.product_name,
        SUM(fs.quantity) AS units_sold,
        SUM(fs.total_amount) AS total_revenue,
        SUM(fs.total_amount - fs.cost_amount) AS total_profit,
        COUNT(DISTINCT fs.order_id) AS orders_count,
        COUNT(DISTINCT fs.customer_id) AS unique_customers,
        AVG(fs.unit_price) AS avg_selling_price,
        
        -- Métricas de performance
        ROUND(100.0 * SUM(fs.total_amount - fs.cost_amount) / SUM(fs.total_amount), 2) AS profit_margin_pct,
        ROUND(SUM(fs.total_amount) / COUNT(DISTINCT fs.order_id), 2) AS revenue_per_order,
        ROUND(SUM(fs.quantity) / COUNT(DISTINCT fs.order_id), 2) AS units_per_order
    FROM fact_sales fs
    JOIN dim_product dp ON fs.product_key = dp.product_key
    JOIN dim_date dd ON fs.date_key = dd.date_key
    WHERE dd.date_actual >= CURRENT_DATE - INTERVAL '12 months'
    GROUP BY dp.category, dp.subcategory, dp.product_name
),
ranked_products AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (ORDER BY total_revenue DESC) AS revenue_rank,
        ROW_NUMBER() OVER (ORDER BY total_profit DESC) AS profit_rank,
        ROW_NUMBER() OVER (ORDER BY units_sold DESC) AS volume_rank,
        
        -- Percentis de performance
        PERCENT_RANK() OVER (ORDER BY total_revenue) AS revenue_percentile,
        PERCENT_RANK() OVER (ORDER BY profit_margin_pct) AS margin_percentile
    FROM sales_performance
),
category_summary AS (
    SELECT 
        category,
        SUM(total_revenue) AS category_revenue,
        SUM(total_profit) AS category_profit,
        SUM(units_sold) AS category_units,
        COUNT(*) AS products_count,
        AVG(profit_margin_pct) AS avg_margin_pct
    FROM sales_performance
    GROUP BY category
)
SELECT 
    rp.*,
    cs.category_revenue,
    cs.category_profit,
    ROUND(100.0 * rp.total_revenue / cs.category_revenue, 2) AS share_of_category_revenue,
    
    -- Classificação de produtos
    CASE 
        WHEN revenue_percentile >= 0.8 THEN 'A - Top Performers'
        WHEN revenue_percentile >= 0.6 THEN 'B - Good Performers'
        WHEN revenue_percentile >= 0.4 THEN 'C - Average Performers'
        WHEN revenue_percentile >= 0.2 THEN 'D - Below Average'
        ELSE 'E - Poor Performers'
    END AS product_classification,
    
    -- Recomendações
    CASE 
        WHEN profit_margin_pct < 10 THEN 'Revisar Preços'
        WHEN units_sold < 100 THEN 'Aumentar Marketing'
        WHEN revenue_rank <= 10 THEN 'Produto Estrela'
        ELSE 'Manter Estratégia'
    END AS recommendation
FROM ranked_products rp
JOIN category_summary cs ON rp.category = cs.category
ORDER BY total_revenue DESC;
```

#### 3. 👥 Dashboard de Clientes

**Análise 360° do Cliente**
```sql
-- Dashboard de Clientes - Visão 360°
WITH customer_metrics AS (
    SELECT 
        dc.customer_id,
        dc.customer_name,
        dc.customer_tier,
        dc.registration_date,
        
        -- Métricas transacionais
        COUNT(DISTINCT fs.order_id) AS total_orders,
        SUM(fs.total_amount) AS lifetime_value,
        AVG(fs.total_amount) AS avg_order_value,
        SUM(fs.quantity) AS total_items_purchased,
        
        -- Métricas temporais
        MIN(dd.date_actual) AS first_purchase_date,
        MAX(dd.date_actual) AS last_purchase_date,
        CURRENT_DATE - MAX(dd.date_actual) AS days_since_last_purchase,
        MAX(dd.date_actual) - MIN(dd.date_actual) AS customer_lifespan_days,
        
        -- Frequência de compra
        CASE 
            WHEN MAX(dd.date_actual) - MIN(dd.date_actual) > 0 THEN
                COUNT(DISTINCT fs.order_id)::DECIMAL / 
                EXTRACT(DAYS FROM (MAX(dd.date_actual) - MIN(dd.date_actual))) * 30
            ELSE 0
        END AS avg_orders_per_month
    FROM dim_customer dc
    LEFT JOIN fact_sales fs ON dc.customer_key = fs.customer_key
    LEFT JOIN dim_date dd ON fs.date_key = dd.date_key
    WHERE dd.date_actual >= CURRENT_DATE - INTERVAL '24 months'
    GROUP BY dc.customer_id, dc.customer_name, dc.customer_tier, dc.registration_date
),
customer_segmentation AS (
    SELECT 
        *,
        -- Segmentação RFM simplificada
        CASE 
            WHEN days_since_last_purchase <= 30 AND total_orders >= 10 AND lifetime_value >= 5000 THEN 'Champions'
            WHEN days_since_last_purchase <= 60 AND total_orders >= 5 AND lifetime_value >= 2000 THEN 'Loyal Customers'
            WHEN days_since_last_purchase <= 30 AND total_orders <= 3 THEN 'New Customers'
            WHEN days_since_last_purchase BETWEEN 61 AND 120 AND total_orders >= 5 THEN 'Potential Loyalists'
            WHEN days_since_last_purchase BETWEEN 121 AND 180 THEN 'At Risk'
            WHEN days_since_last_purchase > 180 THEN 'Lost Customers'
            ELSE 'Others'
        END AS customer_segment,
        
        -- Valor do cliente
        CASE 
            WHEN lifetime_value >= 10000 THEN 'High Value'
            WHEN lifetime_value >= 5000 THEN 'Medium Value'
            WHEN lifetime_value >= 1000 THEN 'Low Value'
            ELSE 'Very Low Value'
        END AS value_segment,
        
        -- Risco de churn
        CASE 
            WHEN days_since_last_purchase > 180 THEN 'High Risk'
            WHEN days_since_last_purchase > 90 THEN 'Medium Risk'
            WHEN days_since_last_purchase > 60 THEN 'Low Risk'
            ELSE 'Active'
        END AS churn_risk
    FROM customer_metrics
),
segment_summary AS (
    SELECT 
        customer_segment,
        COUNT(*) AS customers_count,
        SUM(lifetime_value) AS segment_revenue,
        AVG(lifetime_value) AS avg_customer_value,
        AVG(total_orders) AS avg_orders,
        AVG(days_since_last_purchase) AS avg_days_since_purchase
    FROM customer_segmentation
    GROUP BY customer_segment
)
SELECT 
    cs.*,
    ss.customers_count AS segment_size,
    ss.segment_revenue,
    ROUND(100.0 * cs.lifetime_value / ss.segment_revenue, 2) AS share_of_segment_revenue,
    
    -- Recomendações por segmento
    CASE 
        WHEN customer_segment = 'Champions' THEN 'Programa VIP e Cross-sell'
        WHEN customer_segment = 'Loyal Customers' THEN 'Programa de Fidelidade'
        WHEN customer_segment = 'New Customers' THEN 'Onboarding e Educação'
        WHEN customer_segment = 'At Risk' THEN 'Campanha de Reativação'
        WHEN customer_segment = 'Lost Customers' THEN 'Win-back Campaign'
        ELSE 'Estratégia Personalizada'
    END AS recommended_action
FROM customer_segmentation cs
JOIN segment_summary ss ON cs.customer_segment = ss.customer_segment
ORDER BY lifetime_value DESC;
```

### 📈 KPIs e Métricas

#### 1. 💰 KPIs Financeiros

**Métricas de Receita e Rentabilidade**
```sql
-- KPIs Financeiros Principais
WITH financial_kpis AS (
    SELECT 
        -- Período de análise
        DATE_TRUNC('month', dd.date_actual) AS month,
        
        -- Receitas
        SUM(fs.total_amount) AS gross_revenue,
        SUM(fs.total_amount - fs.discount_amount) AS net_revenue,
        SUM(fs.total_amount - fs.cost_amount) AS gross_profit,
        SUM(fs.total_amount - fs.cost_amount - fs.operating_expenses) AS operating_profit,
        
        -- Custos
        SUM(fs.cost_amount) AS total_costs,
        SUM(fs.operating_expenses) AS operating_expenses,
        SUM(fs.discount_amount) AS total_discounts,
        
        -- Volumes
        COUNT(DISTINCT fs.order_id) AS total_transactions,
        SUM(fs.quantity) AS total_units_sold,
        COUNT(DISTINCT fs.customer_id) AS active_customers
    FROM fact_sales fs
    JOIN dim_date dd ON fs.date_key = dd.date_key
    WHERE dd.date_actual >= CURRENT_DATE - INTERVAL '24 months'
    GROUP BY DATE_TRUNC('month', dd.date_actual)
),
calculated_kpis AS (
    SELECT 
        month,
        gross_revenue,
        net_revenue,
        gross_profit,
        operating_profit,
        
        -- Margens
        ROUND(100.0 * gross_profit / gross_revenue, 2) AS gross_margin_pct,
        ROUND(100.0 * operating_profit / gross_revenue, 2) AS operating_margin_pct,
        ROUND(100.0 * total_discounts / gross_revenue, 2) AS discount_rate_pct,
        
        -- Métricas por transação
        ROUND(gross_revenue / total_transactions, 2) AS avg_transaction_value,
        ROUND(gross_profit / total_transactions, 2) AS avg_profit_per_transaction,
        
        -- Métricas por cliente
        ROUND(gross_revenue / active_customers, 2) AS revenue_per_customer,
        ROUND(total_transactions::DECIMAL / active_customers, 2) AS transactions_per_customer,
        
        -- Eficiência operacional
        ROUND(operating_expenses / gross_revenue * 100, 2) AS opex_ratio_pct,
        ROUND(total_costs / total_units_sold, 2) AS cost_per_unit
    FROM financial_kpis
)
SELECT 
    month,
    gross_revenue,
    net_revenue,
    gross_profit,
    operating_profit,
    gross_margin_pct,
    operating_margin_pct,
    discount_rate_pct,
    avg_transaction_value,
    revenue_per_customer,
    
    -- Crescimento mês a mês
    LAG(gross_revenue) OVER (ORDER BY month) AS prev_month_revenue,
    ROUND(100.0 * (gross_revenue - LAG(gross_revenue) OVER (ORDER BY month)) / 
          LAG(gross_revenue) OVER (ORDER BY month), 2) AS revenue_growth_mom,
    
    -- Crescimento ano a ano
    LAG(gross_revenue, 12) OVER (ORDER BY month) AS prev_year_revenue,
    ROUND(100.0 * (gross_revenue - LAG(gross_revenue, 12) OVER (ORDER BY month)) / 
          LAG(gross_revenue, 12) OVER (ORDER BY month), 2) AS revenue_growth_yoy,
    
    -- Indicadores de saúde financeira
    CASE 
        WHEN gross_margin_pct >= 40 THEN 'Excelente'
        WHEN gross_margin_pct >= 25 THEN 'Boa'
        WHEN gross_margin_pct >= 15 THEN 'Aceitável'
        ELSE 'Preocupante'
    END AS margin_health,
    
    CASE 
        WHEN operating_margin_pct >= 15 THEN 'Muito Rentável'
        WHEN operating_margin_pct >= 10 THEN 'Rentável'
        WHEN operating_margin_pct >= 5 THEN 'Moderadamente Rentável'
        ELSE 'Baixa Rentabilidade'
    END AS profitability_status
FROM calculated_kpis
ORDER BY month DESC;
```

#### 2. 📊 KPIs Operacionais

**Métricas de Eficiência Operacional**
```sql
-- KPIs Operacionais
WITH operational_metrics AS (
    SELECT 
        DATE_TRUNC('week', dd.date_actual) AS week,
        
        -- Métricas de pedidos
        COUNT(DISTINCT fs.order_id) AS total_orders,
        COUNT(DISTINCT CASE WHEN fs.order_status = 'completed' THEN fs.order_id END) AS completed_orders,
        COUNT(DISTINCT CASE WHEN fs.order_status = 'cancelled' THEN fs.order_id END) AS cancelled_orders,
        COUNT(DISTINCT CASE WHEN fs.order_status = 'returned' THEN fs.order_id END) AS returned_orders,
        
        -- Métricas de tempo
        AVG(fs.processing_time_hours) AS avg_processing_time,
        AVG(fs.shipping_time_hours) AS avg_shipping_time,
        AVG(fs.delivery_time_hours) AS avg_delivery_time,
        
        -- Métricas de qualidade
        COUNT(DISTINCT CASE WHEN fs.customer_rating >= 4 THEN fs.order_id END) AS high_rated_orders,
        AVG(fs.customer_rating) AS avg_customer_rating,
        
        -- Métricas de estoque
        AVG(dp.stock_level) AS avg_stock_level,
        COUNT(DISTINCT CASE WHEN dp.stock_level = 0 THEN dp.product_id END) AS out_of_stock_products
    FROM fact_sales fs
    JOIN dim_date dd ON fs.date_key = dd.date_key
    JOIN dim_product dp ON fs.product_key = dp.product_key
    WHERE dd.date_actual >= CURRENT_DATE - INTERVAL '12 weeks'
    GROUP BY DATE_TRUNC('week', dd.date_actual)
),
operational_kpis AS (
    SELECT 
        week,
        total_orders,
        completed_orders,
        cancelled_orders,
        returned_orders,
        
        -- Taxas de conversão e qualidade
        ROUND(100.0 * completed_orders / total_orders, 2) AS completion_rate_pct,
        ROUND(100.0 * cancelled_orders / total_orders, 2) AS cancellation_rate_pct,
        ROUND(100.0 * returned_orders / completed_orders, 2) AS return_rate_pct,
        ROUND(100.0 * high_rated_orders / completed_orders, 2) AS satisfaction_rate_pct,
        
        -- Métricas de tempo (SLA)
        ROUND(avg_processing_time, 1) AS avg_processing_hours,
        ROUND(avg_shipping_time, 1) AS avg_shipping_hours,
        ROUND(avg_delivery_time, 1) AS avg_delivery_hours,
        ROUND(avg_processing_time + avg_shipping_time + avg_delivery_time, 1) AS total_fulfillment_time,
        
        -- Métricas de qualidade
        ROUND(avg_customer_rating, 2) AS avg_rating,
        out_of_stock_products,
        
        -- Indicadores de performance
        CASE 
            WHEN avg_processing_time <= 24 THEN 'Excelente'
            WHEN avg_processing_time <= 48 THEN 'Bom'
            WHEN avg_processing_time <= 72 THEN 'Aceitável'
            ELSE 'Lento'
        END AS processing_performance,
        
        CASE 
            WHEN completion_rate_pct >= 95 THEN 'Excelente'
            WHEN completion_rate_pct >= 90 THEN 'Bom'
            WHEN completion_rate_pct >= 85 THEN 'Aceitável'
            ELSE 'Problemático'
        END AS completion_performance
    FROM operational_metrics
)
SELECT 
    week,
    total_orders,
    completion_rate_pct,
    cancellation_rate_pct,
    return_rate_pct,
    satisfaction_rate_pct,
    avg_processing_hours,
    avg_shipping_hours,
    avg_delivery_hours,
    total_fulfillment_time,
    avg_rating,
    out_of_stock_products,
    processing_performance,
    completion_performance,
    
    -- Tendências semanais
    LAG(completion_rate_pct) OVER (ORDER BY week) AS prev_week_completion,
    completion_rate_pct - LAG(completion_rate_pct) OVER (ORDER BY week) AS completion_trend,
    
    LAG(avg_rating) OVER (ORDER BY week) AS prev_week_rating,
    ROUND(avg_rating - LAG(avg_rating) OVER (ORDER BY week), 2) AS rating_trend
FROM operational_kpis
ORDER BY week DESC;
```

### 🎯 Casos de Uso Práticos

#### 1. 🏢 Relatório Executivo Mensal

**Automação de Relatório para Diretoria**
```python
class ExecutiveReportGenerator:
    def __init__(self, db_connection):
        self.db = db_connection
        self.report_date = datetime.now()
    
    def generate_monthly_report(self, month, year):
        """Gerar relatório executivo mensal"""
        
        # 1. KPIs Principais
        financial_kpis = self._get_financial_kpis(month, year)
        operational_kpis = self._get_operational_kpis(month, year)
        customer_kpis = self._get_customer_kpis(month, year)
        
        # 2. Análises Comparativas
        mom_analysis = self._get_month_over_month_analysis(month, year)
        yoy_analysis = self._get_year_over_year_analysis(month, year)
        
        # 3. Insights e Alertas
        insights = self._generate_insights(financial_kpis, operational_kpis)
        alerts = self._generate_alerts(financial_kpis, operational_kpis)
        
        # 4. Previsões
        forecasts = self._generate_forecasts(month, year)
        
        # 5. Gerar relatório
        report = self._compile_executive_report({
            'period': f"{month}/{year}",
            'financial_kpis': financial_kpis,
            'operational_kpis': operational_kpis,
            'customer_kpis': customer_kpis,
            'mom_analysis': mom_analysis,
            'yoy_analysis': yoy_analysis,
            'insights': insights,
            'alerts': alerts,
            'forecasts': forecasts
        })
        
        return report
    
    def _get_financial_kpis(self, month, year):
        """Obter KPIs financeiros"""
        query = """
        SELECT 
            SUM(total_amount) as revenue,
            SUM(total_amount - cost_amount) as gross_profit,
            ROUND(100.0 * SUM(total_amount - cost_amount) / SUM(total_amount), 2) as margin_pct,
            COUNT(DISTINCT order_id) as total_orders,
            ROUND(AVG(total_amount), 2) as avg_order_value
        FROM fact_sales fs
        JOIN dim_date dd ON fs.date_key = dd.date_key
        WHERE EXTRACT(MONTH FROM dd.date_actual) = %s 
          AND EXTRACT(YEAR FROM dd.date_actual) = %s
        """
        
        result = self.db.execute(query, (month, year)).fetchone()
        
        return {
            'revenue': result[0],
            'gross_profit': result[1],
            'margin_pct': result[2],
            'total_orders': result[3],
            'avg_order_value': result[4]
        }
    
    def _generate_insights(self, financial_kpis, operational_kpis):
        """Gerar insights automáticos"""
        insights = []
        
        # Insight de receita
        if financial_kpis['revenue'] > 5000000:
            insights.append({
                'type': 'positive',
                'category': 'financial',
                'message': f"Receita de R$ {financial_kpis['revenue']:,.2f} superou meta mensal"
            })
        
        # Insight de margem
        if financial_kpis['margin_pct'] < 25:
            insights.append({
                'type': 'warning',
                'category': 'financial',
                'message': f"Margem de {financial_kpis['margin_pct']}% abaixo do esperado"
            })
        
        # Insight operacional
        if operational_kpis['completion_rate'] < 90:
            insights.append({
                'type': 'alert',
                'category': 'operational',
                'message': f"Taxa de conclusão de {operational_kpis['completion_rate']}% requer atenção"
            })
        
        return insights
    
    def _compile_executive_report(self, data):
        """Compilar relatório final"""
        report_template = f"""
        # RELATÓRIO EXECUTIVO - {data['period']}
        
        ## 📊 RESUMO EXECUTIVO
        
        ### KPIs Principais
        - **Receita**: R$ {data['financial_kpis']['revenue']:,.2f}
        - **Lucro Bruto**: R$ {data['financial_kpis']['gross_profit']:,.2f}
        - **Margem**: {data['financial_kpis']['margin_pct']}%
        - **Pedidos**: {data['financial_kpis']['total_orders']:,}
        
        ### Crescimento
        - **MoM**: {data['mom_analysis']['revenue_growth']}%
        - **YoY**: {data['yoy_analysis']['revenue_growth']}%
        
        ## 🎯 INSIGHTS PRINCIPAIS
        """
        
        for insight in data['insights']:
            report_template += f"\n- {insight['message']}"
        
        report_template += f"""
        
        ## ⚠️ ALERTAS
        """
        
        for alert in data['alerts']:
            report_template += f"\n- {alert['message']}"
        
        return report_template
```

#### 2. 📈 Sistema de Alertas Automáticos

**Monitoramento Proativo de KPIs**
```python
class BusinessAlertsSystem:
    def __init__(self, db_connection, notification_service):
        self.db = db_connection
        self.notifications = notification_service
        self.alert_rules = self._load_alert_rules()
    
    def check_all_alerts(self):
        """Verificar todos os alertas configurados"""
        alerts_triggered = []
        
        # Verificar alertas financeiros
        financial_alerts = self._check_financial_alerts()
        alerts_triggered.extend(financial_alerts)
        
        # Verificar alertas operacionais
        operational_alerts = self._check_operational_alerts()
        alerts_triggered.extend(operational_alerts)
        
        # Verificar alertas de clientes
        customer_alerts = self._check_customer_alerts()
        alerts_triggered.extend(customer_alerts)
        
        # Enviar notificações
        for alert in alerts_triggered:
            self._send_alert_notification(alert)
        
        return alerts_triggered
    
    def _check_financial_alerts(self):
        """Verificar alertas financeiros"""
        alerts = []
        
        # Alert: Receita diária abaixo da meta
        daily_revenue = self._get_daily_revenue()
        if daily_revenue < 150000:  # Meta diária
            alerts.append({
                'type': 'financial',
                'severity': 'high',
                'title': 'Receita Diária Abaixo da Meta',
                'message': f'Receita hoje: R$ {daily_revenue:,.2f} (Meta: R$ 150.000)',
                'recipients': ['cfo@empresa.com', 'ceo@empresa.com']
            })
        
        # Alert: Margem de lucro baixa
        current_margin = self._get_current_margin()
        if current_margin < 20:  # Margem mínima
            alerts.append({
                'type': 'financial',
                'severity': 'medium',
                'title': 'Margem de Lucro Baixa',
                'message': f'Margem atual: {current_margin}% (Mínimo: 20%)',
                'recipients': ['cfo@empresa.com', 'operations@empresa.com']
            })
        
        return alerts
    
    def _check_operational_alerts(self):
        """Verificar alertas operacionais"""
        alerts = []
        
        # Alert: Taxa de cancelamento alta
        cancellation_rate = self._get_cancellation_rate()
        if cancellation_rate > 5:  # Limite de 5%
            alerts.append({
                'type': 'operational',
                'severity': 'high',
                'title': 'Taxa de Cancelamento Elevada',
                'message': f'Taxa atual: {cancellation_rate}% (Limite: 5%)',
                'recipients': ['operations@empresa.com', 'customer-service@empresa.com']
            })
        
        # Alert: Produtos em falta
        out_of_stock_count = self._get_out_of_stock_count()
        if out_of_stock_count > 10:
            alerts.append({
                'type': 'operational',
                'severity': 'medium',
                'title': 'Produtos em Falta no Estoque',
                'message': f'{out_of_stock_count} produtos sem estoque',
                'recipients': ['inventory@empresa.com', 'operations@empresa.com']
            })
        
        return alerts
    
    def _send_alert_notification(self, alert):
        """Enviar notificação de alerta"""
        # Email
        self.notifications.send_email(
            recipients=alert['recipients'],
            subject=f"[ALERTA {alert['severity'].upper()}] {alert['title']}",
            body=alert['message']
        )
        
        # Slack (para alertas críticos)
        if alert['severity'] == 'high':
            self.notifications.send_slack_message(
                channel='#alerts',
                message=f"🚨 {alert['title']}: {alert['message']}"
            )
        
        # Dashboard (atualizar indicadores)
        self.notifications.update_dashboard_alert(alert)
```

### 🎯 Competências Demonstradas

#### SQL e Analytics
- ✅ **SQL Avançado**: CTEs, window functions, análises complexas
- ✅ **Business Intelligence**: KPIs, dashboards, relatórios executivos
- ✅ **Data Modeling**: Modelagem dimensional, agregações
- ✅ **Performance Optimization**: Indexação, particionamento, query tuning

#### Visualização e BI Tools
- ✅ **Apache Superset**: Dashboards open-source
- ✅ **Power BI**: Relatórios corporativos Microsoft
- ✅ **Tableau**: Visualizações avançadas
- ✅ **Grafana**: Monitoramento operacional

#### Automação e APIs
- ✅ **Report Automation**: Geração automática de relatórios
- ✅ **Alert Systems**: Sistemas de monitoramento proativo
- ✅ **API Development**: APIs para dados e métricas
- ✅ **ETL Pipelines**: Pipelines de dados automatizados

---

## 🇺🇸 English

### 📊 Overview

Comprehensive **Business Intelligence** platform developed with advanced SQL and modern visualization tools:

- 📈 **Executive Dashboards**: Strategic KPIs and business metrics
- 🔍 **Advanced Analytics**: Cohort, RFM, forecasting, trend analysis
- 📊 **Interactive Visualizations**: Power BI, Tableau, Apache Superset
- 🎯 **Self-Service BI**: Tools for non-technical users
- 📋 **Automated Reports**: Automatic report generation
- 🔄 **Smart ETL**: Optimized data pipelines

### 🎯 Platform Objectives

- **Democratize access** to data and insights
- **Accelerate decision-making** with real-time data
- **Standardize metrics** and business definitions
- **Automate reports** operational and strategic
- **Facilitate self-service** analytics for users

### 📊 Implemented Dashboards

#### 1. 📈 Executive Dashboard
- Strategic KPIs and financial metrics
- Month-over-month and year-over-year growth
- Performance scorecards vs targets
- Executive summary and insights

#### 2. 🛍️ Sales Dashboard
- Sales performance analysis
- Product ranking and categorization
- Revenue and profit analysis
- Sales team performance

#### 3. 👥 Customer Dashboard
- 360° customer view
- RFM segmentation
- Customer lifetime value
- Churn risk analysis

### 🎯 Skills Demonstrated

#### SQL and Analytics
- ✅ **Advanced SQL**: CTEs, window functions, complex analyses
- ✅ **Business Intelligence**: KPIs, dashboards, executive reports
- ✅ **Data Modeling**: Dimensional modeling, aggregations
- ✅ **Performance Optimization**: Indexing, partitioning, query tuning

#### Visualization and BI Tools
- ✅ **Apache Superset**: Open-source dashboards
- ✅ **Power BI**: Microsoft corporate reports
- ✅ **Tableau**: Advanced visualizations
- ✅ **Grafana**: Operational monitoring

#### Automation and APIs
- ✅ **Report Automation**: Automatic report generation
- ✅ **Alert Systems**: Proactive monitoring systems
- ✅ **API Development**: APIs for data and metrics
- ✅ **ETL Pipelines**: Automated data pipelines

---

## 📄 Licença | License

MIT License - veja o arquivo [LICENSE](LICENSE) para detalhes | see [LICENSE](LICENSE) file for details

## 📞 Contato | Contact

**GitHub**: [@galafis](https://github.com/galafis)  
**LinkedIn**: [Gabriel Demetrios Lafis](https://linkedin.com/in/galafis)  
**Email**: gabriel.lafis@example.com

---

<div align="center">

**Desenvolvido com ❤️ para Business Intelligence | Developed with ❤️ for Business Intelligence**

[![GitHub](https://img.shields.io/badge/GitHub-galafis-blue?style=flat-square&logo=github)](https://github.com/galafis)
[![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat-square&logo=postgresql&logoColor=white)](https://www.postgresql.org/)

</div>

