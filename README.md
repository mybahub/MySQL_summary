# SQL

## 1.0 Topics
### 1.1 Date
* break down [1384](1301-1700/1384Total_sales_amount_by_year.sql)
* date shift
  + join + DATE_SUB [1097](1001-1300/1097.Game_play_analysi_V.sql)

### 1.2 Text
  + Exist a pattern (Like/REGEXP_LIKE)[1527](1301-1700/1527.Patients_with_a_condition.sql)

### 1.3 Break columns
  + if function [1322](1301-1700/1322.Ads_performance.sql), [1205](1001-1300/1205.Monthly_transction_ii.sql)
  + row_num+group by ~(pivot) [618](100-1000/618.Students_report_by_geography.sql)
  + time period with recursive [1384](1301-1700/1384Total_sales_amount_by_year.sql)

### 1.4 Merge columns
  + stack columns with union all [1783](1301-1700/1783.Grand_Slam_Titles.sql),[602](100-1000/602.Friend_request_ii_who_has_the_most_freiends.sql),[1795](1701-2000/1795.Rearrange_products_table.sql)


### 1.5 combine rows
  + AS + union all + group by [1841](1701-2000/1841.League_statistics.sql)

### 1.6 extract info from each group by condition
  + maximum: max+partition by [1077](1001-1300/1077.Project_employee_ii.sql)
  + most recent : dense_rank() [1549](1301-1700/1549.The_most_recent_orders_for_each_product.sql)

### 1.7 Consecutive values
  +  Consecutive date [550](100-1000/550.Game_play_analysis_IV.sql)
  +  3+Consecutive id [1811](1701-2000/1811.Find_interview_candidates.sql)



## 2.0
### 2.1 Recursive
* break one row [1384](1301-1700/1384Total_sales_amount_by_year.sql)

* making a full list [1336](1301-1700/1336.Number_of_trans.sql), [1613](1301-1700/1613.Find_the_missing_ids.sql)

### 2.2 Window Function

* count frequency [534](100-1000/534Game_play_analysis.sql),

* extract by order
  + second most recent [1369](1301-1700/1369.Get_the_second_most_recent_activity.sql)
  + Highest grade for each student [1112](1001-1300/1112Highest_grade_for_each_student.sql)

### 2.3 array
  [585](100-1000/585.Investment_in_2016.sql)
