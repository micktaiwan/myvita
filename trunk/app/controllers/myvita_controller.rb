class MyvitaController < ApplicationController
  
  def index
    return if session['user']==nil
    @steps = session['user'].steps
    #@steps = @steps.sort_by {|s| s.startdate}.reverse
  end
  
  def new
    @step = Step.new
    @step.user_id = session['user']['id']
    @step.save
    render :partial => "new", :locals=>{:edit=>@step}
  end
  
  def add_descr
    step_id = params['sid']
    d = Step.find(step_id).descrs.create
    d.save		
    render :partial => 'descr_edit', :locals=>{:descr_edit=>d}
  end
  
  def edit
    @edit = Step.find(params['id'])
    render :partial => "edit", :locals=>{:edit=>@edit}
  end
  
  def edit_descr
    d = Descr.find(params['id'])
    render :partial => "descr_edit", :locals=>{:descr_edit=>d}
  end	
  
  def delete
    Step.find(params['id']).destroy
    render_text 'Deleted !'
  end	
  
  def delete_descr
    d = Descr.find(params['id'])
    d.destroy
    render_text 'Deleted !'
  end
  
  def save_changes
    d = Step.update(params['id'],params['edit'])
    render :partial => "step", :locals=>{:step=>d }
  end
  
  def save_descr
    d = Descr.update(params['id'],params['d'])
    render :partial => "step", :locals=>{:step=>d.step }
  end
  
end
