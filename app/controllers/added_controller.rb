#Processes the form for adding an award
MyApp.post "/award_added" do 
  @events = Event.find_by_id(params["event_id"])

  if @events.is_complete
    x = Award.new
    x.event_id = params["event_id"]
    x.competitor_id = params["competitor_id"]
    x.rank = params["rank"]
 #  x.is_valid == true  ---> this is not working
    x.save
    erb :"added/award_added"
  else
    erb :"misc/event_not_over"
  end
end

#Processes the form for adding a college
MyApp.post "/college_added" do 
  x = College.new
  x.college_name = params["college_name"]
  x.conference_id = params["conference_id"]
  if x.is_valid == true
    x.save
    erb :"added/college_added"
  else
    erb :"misc/error"
  end
end

#Processes the form for adding a competitor
MyApp.post "/competitor_added" do 
  x = Competitor.new
  x.competitor_name = params["competitor_name"]
  x.college_id = params["college_id"]
  x.save
  erb :"added/competitor_added"
end

#Processes the form for adding a conference
MyApp.post "/conference_added" do 
  x = Conference.new
  x.conference_name = params["conference_name"]
  x.save
  erb :"added/conference_added"
end

#Processes the form to add an event
MyApp.post "/event_added" do 
  x = Event.new
  x.event_name = params["event_name"]
  x.locked = false 
  x.save
  erb :"added/event_added"
end

#Processes the form to add event details
MyApp.post "/event_detail_added" do 
  @event = Event.find_by_id(params["event_id"])

  if @event.locked == false
    x = EventDetail.new
    x.event_id = params["event_id"]
    x.competitor_id = params["competitor_id"]
    x.finish_time = params["finish_time"]
    x.save
    erb :"added/event_detail_added"
  else
    erb :"misc/event_locked"
  end
end