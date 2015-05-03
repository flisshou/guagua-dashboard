class Activity < ActiveRecord::Base
  self.table_name = "b01a2_activity"

  def self.show
    query = <<-SQL
    select service.Service_Name,count(activity.Service_id) as activity_count from (select * from b01a2_activity limit 10000) as activity
    inner join b01a2_service  as service on activity.Service_id =service.Service_id group by activity.Service_id;;
    SQL

    data=self.find_by_sql(query)#.pluck("Service_id")
    data.map{|d| {name:d.Service_Name.strip,count:d.activity_count}}
  end
end
