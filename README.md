# BigBasket Analytics Dashboard: Sales, Product Performance, and Customer Insights

## Table of Contents

- [Project Background](#project-background)
- [Tools Used](#tools-used)
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

## Data Structure

The database structure for this analysis, as shown below, consists of four tables: **Orders, Products, Customers, and Dates**. The final integrated dataset contains **5,011 records**.

### ERD

<p align="center">
  <img width="834" height="539" alt="image" src="https://github.com/user-attachments/assets/45b2e6a7-8b48-4088-b68f-76496d7da8eb" />
</p>

## Executive Summary

- [Sales and Product Insights](sales--product-insights)
- [Customer Insights](customer-insights)

### Sales and Product Insights

-	Total sales stood at ₹3.33M across 5,011 orders with 10,051 units of 4589 unique products sold, resulting in an AOV of ₹664.98.
-	Sales were stable in aggregate across 2023–2024, but volatile at a monthly level. 2023 (starting from 16th March) contributed ₹1.62M in sales, while 2024 (till 11th Nov) reached ₹1.71M, indicating a moderate year-on-year growth of ~ 5.6%.
-	Monthly performance shows October 2023 peaking at ₹212.40 K sales, while September 2024 became the second highest at ₹198.68 K, reflecting strong festive-season demand in both years.
-	Beauty & Hygiene dominated sales, contributing 39.4%, with fragrances, deos, and skincare driving nearly 58% of that revenue. Despite low discounting (12.1%), the category sustained strong organic demand backed by trusted brand appeal. 
-	Kitchen, Garden & Pets category ranked second in sales (19.8%), powered by crockery, cookware and storage essentials (68.4% share), where a discount of 23.4% (2nd highest of all) amplified already strong demand. The third highest revenue generating category Gourmet & World Food (15.8%) relied on oils, vinegar, dry fruits, chocolates, and snacks, with relatively low discounts (8.5%) supporting steady volumes.
-	In contrast, Fruits & Vegetables (0.31%) and Electronics (0.04%) contributed negligibly to sales with Electronics offering the highest 60.3% discount yet failing to drive demand. 
-	Overall, growth leaned on personal care and lifestyle categories where customer preference, brand popularity or product quality outweighed price cuts, while selective discounts boosted only those segments with strong inherent demand.
-	State-wise sales show Uttar Pradesh (₹431.9K) and Andhra Pradesh (₹342.8K) leading, followed by Maharashtra (₹311.1K) and Tamil Nadu (₹277.4K). However, Delhi, ranking 13th in total sales, but recorded the highest AOV (₹1,165), nearly double the overall average, suggesting fewer but larger-value purchases. The top 5 states with highest AOV do not fall in the list of top 10 states with highest sales.
-	Delivery performance is below industry benchmarks with only 69.3% of orders arriving on time (within 15 minutes), but 9.92% are significantly delayed (over 30 minutes)—a risk that can affect customer satisfaction and repeat purchases.
-	DKNY generated the highest revenue of ~90K from only 20 units sold, despite the fact that all its products purchased could not cross an average rating of even 4, highlighting that people still buy them largely due to brand value. Prestige followed with sales of 60K+ with an average selling price of ₹2145.25. 
-	However, Bigbasket’s another venture Fresho, which sells everyday staples like fresh fruits, vegetables, meat, grains etc. recorded the highest volume with 236 units sold but failed to rank high in revenue. The company’s in-house product line BB group has also stood out, appearing thrice within the top 10 brands in terms of both rev and no of items purchased. 
-	Staples such as rice, oil, and spices drive purchase volumes but contribute less to revenue due to limited pricing flexibility. On the other hand, categories like electronics, beauty, and hygiene generate greater revenue even with lower quantities sold due to their higher prices, with Braun’s Epilator SE9-9961 emerging as the top contributor.

### Customer Insights

-	BigBasket catered to 2,166 unique customers during this period, with the base rising slightly from 1,567 in 2023 to 1,607 in 2024 (+2.6%). However, growth momentum slowed—after peaking at 686 customers in Q3 2023, acquisition fell to just 266 by Q4 2024 (recorded till 11th Nov). 
-	While new customer acquisition declined steadily by about 74% from its May 2023 peak (223) over the following year, repeat customers more than doubled (from 90 in August 2023 to 206 in August 2024), indicating weakening acquisition but stronger retention and a growing reliance on the existing base. 
-	Customer concentration is high in major states like Uttar Pradesh, Andhra Pradesh, Maharashtra, West Bengal, Bihar, and Tamil Nadu, implying sales are clustered in a few key states, while underpenetrated regions such as the West and Northeast present opportunities for expansion.
-	Customers show no strong bias toward any single payment method, with Cash, Card, UPI and App Wallet contributing almost equally to sales, orders, and AOV — indicating that all four modes are almost equally preferred and widely adopted.
-	As expected, Regular and Premium users placed the highest number of orders and quantities, with regulars generating the most revenue (₹883K). 
-	Surprisingly, inactive users, despite fewer orders, outperformed premium ones with ₹830K revenue and the highest AOV (₹696.25), showing infrequent but high-value purchases and a clear need for reactivation strategies. 
-	Premium users, expected to dominate, instead recorded the lowest AOV among all groups, while new customers added ₹804K revenue with moderate AOV (₹654.73) across 1,228 orders, suggesting they could be price-conscious, likely testing the platform.

## Recommendations

-	Heavy discounts did not translate into higher sales — as electronics with heavy cuts underperformed, while categories like Beauty & Hygiene and Kitchen, Garden & Pets, with moderate discounts and fair ratings (~4.1), generated the highest revenues. So, BigBasket should reduce over-subsidizing low-demand categories and shift their focus on mid-preforming categories with more price-sensitivity or on core, reliable, high-volume segments with steady sales and brand-driven demand.
-	Discounts should remain within a reasonable range (around 25%) to drive sustainable demand, with steep cuts used only for clearance or excess stock. Rather than depending mainly on discounts, BigBasket should emphasize product quality, brand visibility, and customer relevance— strengthening partnerships with well-known brands, promoting them through better placement and marketing.
-	The heavy decline in new customer acquisition (~74%) highlighted the need for referral programs, targeted regional campaigns, and onboarding offers to expand the base.
-	Repeat buyers and inactive users hold strong revenue potential, making loyalty initiatives and reactivation campaigns important to sustain engagement.
-	With about 10% of orders delayed beyond 30 minutes, delivery operations need tighter management, particularly during peak demand and in high-delay regions.
-	Sales remain uneven across regions, so prioritizing growth in underpenetrated markets such as the West and Northeast will help balance performance.
