class ResumeController < ApplicationController
  
  def index
    return if session['user']==nil
    @col = session['user'].resumes
  end
  
  def new
    @resume = session['user'].resumes.create
    @resume.save
    render :partial => "new", :locals=>{:resume=>@resume}
  end
  
  def update
    @resume = Resume.update(params['id'],params['resume'])
    @resume.descrs.clear
    if not @resume.update_attributes(params['resume'])
      render_action 'edit'
    else
      render :partial => "resume"
    end
  end

  
  def edit
    @resume = Resume.find(params['id'])
    render :partial => "edit", :locals=>{:resume=>@resume}
  end
  
  def delete
    Resume.find(params['id']).destroy
    render_text 'Deleted !'
  end 

  def view
    @resume = Resume.find(params['id'])
    @steps  = @resume.descrs.map {|d| d.step}.uniq
  end
  
end
