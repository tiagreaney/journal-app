class EntriesController < ApplicationController
    #before_action :authenticate_user! # Ensures the user is logged in before accessing the actions
  
    before_action :require_login

    def new
        @entry = Entry.new
    end
    
    def index
        @entries = current_user.entries
    end

    def create
      @entry = current_user.entries.build(entry_params)
  
      if @entry.save
        redirect_to entries_path, notice: 'Entry was successfully created.'
      else
        render :new
      end
    end

    private
    def entry_params
        params.require(:entry).permit(:title, :content)
    end
  

  end