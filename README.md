# Cambodia Province/Municipal
This is Cambodia address database in mysql

## Database Structure
There are two structure of db. feel free to choose what you like.
1. One Table 

| id | type | code | khmer_name | name | sub_of |
| --- | --- | --- | --- | --- | --- |
| 1 | ខេត្ត​ | 1 |  បន្ទាយមានជ័យ |  Banteay Meanchey |  |
| 2 | ស្រុក | 102 |  មង្គលបូរី |  Mongkol Borei | 1 |
| 3 | ឃុំ | 10201 |  បន្ទាយនាង |  Banteay Neang | 2 |
| 4 | ភូមិ | 1020101 |  អូរធំ |  Ou Thum | 3 |

2. Seperate Table
> Province

| id | type | code | khmer_name | name |
| --- | --- | --- | --- | --- |
| 1 | ខេត្ត​ | 1 |  បន្ទាយមានជ័យ |  Banteay Meanchey |
| 2 | ខេត្ត​ | 2 |  បាត់ដំបង |  Battambang |

> District

| id | type | code | khmer_name | name | province_id |
| --- | --- | --- | --- | --- | --- |
| 1 | ស្រុក | 102 |  មង្គលបូរី |  Mongkol Borei | 1 |
| 2 | ស្រុក | 103 |  ភ្នំស្រុក |  Phnum Srok | 1 |

> Commune

| id | type | code | khmer_name | name | province_id | district_id |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | ឃុំ | 10201 |  បន្ទាយនាង |  Banteay Neang | 1 | 1 |
| 2 | ឃុំ | 10201 |  បត់ត្រង់ |  Bat Trang | 1 | 1 |

> Village

| id | type | code | khmer_name | name | province_id | district_id | commune_id |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | ភូមិ | 1020101 |  អូរធំ |  Ou Thum | 1 | 1 | 1 |
| 2 | ភូមិ | 1020102 |  ភ្នំ |  Phnum | 1 | 1 | 1 |

## Reference

http://db.ncdd.gov.kh/gazetteer/view/index.castle
