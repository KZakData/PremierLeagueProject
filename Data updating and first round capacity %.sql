#Updating data in matches table
select * from results

insert into results 
#values (8,1,1)#
#values (9,5,1)#
values (10,2,2)

select * from matches

insert into matches
#values ('2023-08-13',40096,8,6,13,6)#
#values ('2023-08-12',52207,9,3,5,3)#
values ('2023-08-13',17066,10,10,12,10)

#Rename column name in results table
alter table results 
change column home home_goals smallint;
change column away away_goals smallint;

#Data  correction due to mistakes

update matches 
set id_stadium = 18
where id_home = 18

update stadiums
set capacity = 31876
where id_stadium = 7

update stadiums
set capacity = 40569
where id_stadium = 14

update stadiums
set capacity = 52305
where id_stadium = 3


#Looking on attendence in first premier league round per possible capacity
select * from matches
select * from stadiums

select attendance, capacity, full_name from matches
inner join stadiums 
on matches.id_stadium = stadiums.id_stadium 


#Drop table attendacne_capacity#
create temporary table attendacne_capacity
(
attendance int,
capacity int,
full_name varchar(50)
)

select * from attendacne_capacity

insert into attendacne_capacity
select attendance, capacity, full_name from matches
inner join stadiums 
on matches.id_stadium = stadiums.id_stadium 


#Finall view on % of capacity on stadiums in first round

select *, (attendance/capacity)*100 as FirstRoundCapacityPercent from attendacne_capacity
order by FirstRoundCapacityPercent desc








