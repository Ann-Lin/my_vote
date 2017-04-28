class CandidatesController < ApplicationController
  before_action :find_candudate, only: [:show, :edit, :update, :destroy, :vote]
  def index
    @candidates = Candidate.all
  end
  
  def show
   
  end
  
  def vote
    log = Log.new(candidate: @candidate, ip_address: request.remote_ip)
    @candidate.logs << log
    @candidate.save
    redirect_to candidates_path,notice: "done!"
  end
 # def vote
 #   @candidate.vote
  #  redirect_to candidates_path,notice: "done!"
 # end
  def new
    @candidate =  Candidate.new
  end
  
  def create
    @candidate= Candidate.new(candidate_params)
  
   
   if  @candidate.save
      redirect_to candidates_path,notice: "add new success!" 
   else
     render 'new'
     # redirect_to new_candidate_path
   end
    
   end
  
  def edit
   
  end
  
  def update
  
   if  @candidate.update(candidate_params)
      redirect_to candidates_path,notice: "update!" 
   else
     render 'edit'
     # redirect_to new_candidate_path
   end
    
  end
  def destroy
   
     @candidate.destroy
    #flash[:notice] = "deleted!"
     redirect_to candidates_path,notice: "deleted!"
  end
  
  private
  def candidate_params
    params.require("candidate").permit(:name,:party,:age,:politics)
  end
  
  def find_candudate
    @candidate = Candidate.find_by(id: params[:id])
     redirect_to candidates_path, notice: "no data!" if @candidate.nil?
  end
  end