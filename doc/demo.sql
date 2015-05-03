select s2.Service_id from (select * from b01a2_activity limit 100) as s2;

select s2.Service_id,count(s2.Service_id) from (select * from b01a2_activity limit 100) as s2 group by s2.Service_id;

select activity.Service_id,service.Service_Name from (select * from b01a2_activity limit 100) as activity
 inner join b01a2_service  as service on activity.Service_id =service.Service_id;

select service.Service_Name,count(activity.Service_id) from (select * from b01a2_activity limit 100) as activity
 inner join b01a2_service  as service on activity.Service_id =service.Service_id group by activity.Service_id;

 -- without index,taking about 6 sec
 select service.Service_Name,count(activity.Service_id) from (select * from b01a2_activity limit 200000) as activity
 inner join b01a2_service  as service on activity.Service_id =service.Service_id group by activity.Service_id;;

-- add_index(:b01a2_activity, :Service_id)
   -- -> 14.6695s
