# BigBasket Analytics Dashboard: Sales, Product Performance, and Customer Insights

## Table of Contents

- [Project Background](#project-background)
- [Tools Used](#tools-used)
- [Resources](#resources)
- [Data Structure](#data-structure)
- [Executive Summary](#executive-summary)
- [Recommendations](#recommendations)

## Project Background

BigBasket, launched in 2011, is India’s first and leading online grocery and lifestyle marketplace, offering over 30,000 products across 60+ cities to millions of customers. Now under Tata Digital's ownership, the company combines extensive product variety with flexible delivery to serve its customer base effectively. It delivers food essentials, fresh produces, staples, personal care, and household products through its website and mobile app.

This project analyzes **BigBasket’s sales, product portfolio, and customer activity between 16th March 2023 and 11th November 2024**. The goal is to uncover key business insights on revenue drivers, product category performances, impact of discounts, customer purchase patterns and acquisition/retention trends, as well as delivery performance and payment behaviours.

## Tools Used

-	Excel → For data preparation, basic cleaning, and initial checks.
-	SQL → For data querying, filtering, transformation, and carrying out exploratory analysis.
-	Power BI → For building interactive dashboards and presenting insights visually.

## Resources

- **Dataset**: Download [here](https://github.com/ta-ni-chkr/bigbasket-business-analytics/raw/main/Dataset.xlsx)
- **SQL Scripts**: Access using the links below
   - [Data Cleaning and Preprocessing](https://github.com/ta-ni-chkr/bigbasket-business-analytics/blob/main/Data%20Cleaning%20and%20Preprocessing.sql)
   - [Analysis](https://github.com/ta-ni-chkr/bigbasket-business-analytics/blob/main/Analysis.sql)
- **Interactive Power Bi Dashboard**: Download [here](https://github.com/ta-ni-chkr/bigbasket-business-analytics/raw/main/Dashboards.pbix)

## Data Structure

The database structure for this analysis, as shown below, consists of four tables: **Orders, Products, Customers, and Dates**. The final integrated dataset contains **5,011 records**.

### ERD

<p align="center">
  <img width="834" height="539" alt="image" src="https://github.com/user-attachments/assets/45b2e6a7-8b48-4088-b68f-76496d7da8eb" />
</p>

## Executive Summary

- [Sales and Product Insights](#sales--product-insights)
- [Customer Insights](#customer-insights)

The interactive Power BI dashboard can be downloaded from [here](
### Sales and Product Insights

- **Total sales** stood at **₹3.33M** across **5,011 orders** with **10,051 units** of **4,589 unique products** sold, resulting in an **AOV of ₹664.98**.  
-	Sales were stable in aggregate across 2023–2024, but volatile at a monthly level. 2023 (starting from 16th March) contributed ₹1.62M in sales, while 2024 (till 11th Nov) reached ₹1.71M, indicating a **moderate year-on-year growth of ~5.6%**.
-	Monthly performance showed October 2023 peaking at ₹212.40K sales, while September 2024 became the second highest at ₹198.68 K, reflecting strong ***festive-season demand*** in both years.
- Among product categories, **Beauty & Hygiene** dominated with 39.4%, driven by fragrances, deos, skincare (*58% share*). Despite **low discounting (*12.1%*)**, the category sustained strong ***organic demand backed by trusted brand appeal***.  
-	Kitchen, Garden & Pets category ranked second in sales (19.8%), powered by crockery, cookware and storage essentials (68.4% share), where a ***23.4% discount*** (2nd highest) amplified the already strong demand. The third highest revenue generating category ***Gourmet & World Food (15.8%)*** relied on oils, vinegar, dry fruits, chocolates, and snacks, with relatively ***low discounts (8.5%)*** supporting steady volumes.
-	In contrast, ***Fruits & Vegetables (0.31%)*** and ***Electronics (0.04%)*** contributed negligibly to sales with ***Electronics offering the highest 60.3%*** discount yet failing to drive demand. 
-	Overall, growth leaned on personal care and lifestyle categories where customer preference, brand popularity or product quality outweighed price cuts, while selective discounts boosted only those segments with strong inherent demand.
-	State-wise sales highlighted ***Uttar Pradesh*** as leading with ₹431.9K, followed by Andhra Pradesh (₹342.8K) and Maharashtra (₹311.1K). However, Delhi, ranking 13th in total sales, but recorded the highest AOV (₹1,165), nearly double the overall average, suggesting fewer but larger-value purchases. The top 5 states with highest AOV do not fall in the list of top 10 states with highest sales.
-	Delivery performance during this period was below industry benchmarks with ***only 69.3% of orders arriving on time*** (within 15 minutes), while 9.92% were significantly delayed (over 30 minutes)—a risk that can affect customer satisfaction and repeat purchases over time.
- **DKNY** generated **highest revenue (*~₹90K*)** from only 20 units sold, despite ***average rating < 4***, suggesting that ***brand value drove sales***. **Prestige** followed with ₹60K+ sales and an average selling price (ASP) of ₹2145.25.  
-	However, Bigbasket’s another venture ***Fresho***, selling fresh fruits, vegetables, meat, grains etc. recorded the highest volume (236 units), but failed to rank high in revenue. The company’s in-house product line ***BB group*** stood out as well, appearing **thrice within the top 10 brands** in terms of both revenue and items purchased.
-	Staples (rice, oil, spices) drove purchase volumes but contributed less to revenue due to limited pricing flexibility. On the other hand, categories like Electronics, Beauty & Hygiene generated greater revenue even with lower quantities sold due to their higher prices, with ***Braun’s Epilator SE9-9961*** emerging as the top contributor.

Previews of the **Sales Performance Dashboard** and **Product Insights Dashboard** are shown below.


<table>
  <tr>
    <td><img width="1308" height="753" alt="image" src="https://github.com/user-attachments/assets/08857747-894f-4706-a947-103ca2732f85" /></td>
    <td><img width="1323" height="762" alt="image" src="https://github.com/user-attachments/assets/567e686a-7565-4d4c-9419-5e73402011db" /></td>
 </tr>
</table>


### Customer Insights

-	BigBasket catered to ***2,166 unique customers*** during this period, with the base rising slightly from 1,567 in 2023 to 1,607 in 2024 (+2.6%). However, growth momentum slowed—after peaking at 686 customers in Q3 2023, acquisition fell to just 266 by Q4 2024 (recorded till 11th Nov). 
-	While ***new customer acquisition declined steadily by about 74%*** from its May 2023 peak (223) over the following year, repeat customers more than doubled (from 90 in August 2023 to 206 in August 2024), indicating weakening acquisition but stronger retention and a growing reliance on the existing base. 
-	Customer concentration was high in major states such as Uttar Pradesh, Andhra Pradesh, Maharashtra, West Bengal, Bihar, and Tamil Nadu, implying sales were clustered in a few key states, while underpenetrated regions such as the West and Northeast presented opportunities for expansion.
-	Customers showed no strong bias toward any single payment method, with Cash, Card, UPI and App Wallet contributing almost equally to sales, orders, and AOV — indicating that all four modes are almost equally preferred and widely adopted.
-	As expected, Regular and Premium users placed the highest number of orders and quantities, with regulars generating the most revenue (₹883K). 
-	Surprisingly, inactive users, despite fewer orders, outperformed premium ones with ₹830K revenue and the highest AOV (₹696.25), showing infrequent but high-value purchases and a clear need for reactivation strategies. 
-	Premium users, expected to dominate, instead recorded the ***lowest AOV*** among all groups, while new customers added ₹804K revenue with moderate AOV (₹654.73) across 1,228 orders, suggesting they could be price-conscious, likely testing the platform.

The following snapshots illustrate **Customer Growth Over Time** and the **Customer Activity Dashboard**.


<table>
  <tr>
    <td><img width="1073" height="723" alt="image" src="https://github.com/user-attachments/assets/92a4a5a1-3c45-4a29-8716-8041149144b1" /></td>
    <td><img width="1323" height="748" alt="image" src="https://github.com/user-attachments/assets/708b9faf-95f5-4923-9a04-ae8d4df3e486" /></td>
  </tr>
</table>


## Recommendations

-	Heavy discounts did not translate into higher sales — as electronics with heavy cuts underperformed, while categories like Beauty & Hygiene and Kitchen, Garden & Pets, with moderate discounts and fair ratings (~4.1), generated the highest revenues. So, BigBasket should reduce over-subsidizing low-demand categories and shift their focus on mid-preforming categories with more price-sensitivity or on core, reliable, high-volume segments with steady sales and brand-driven demand.
-	Discounts should remain within a reasonable range (around 25%) to drive sustainable demand, with steep cuts used only for clearance or excess stock. Rather than depending mainly on discounts, BigBasket should emphasize product quality, brand visibility, and customer relevance— strengthening partnerships with well-known brands, promoting them through better placement and marketing.
-	The heavy decline in new customer acquisition (~74%) highlighted the need for referral programs, targeted regional campaigns, and onboarding offers to expand the base.
-	Repeat buyers and inactive users hold strong revenue potential, making loyalty initiatives and reactivation campaigns important to sustain engagement.
-	With about 10% of orders delayed beyond 30 minutes, delivery operations need tighter management, particularly during peak demand and in high-delay regions.
-	Sales remain uneven across regions, so prioritizing growth in underpenetrated markets such as the West and Northeast will help balance performance.
