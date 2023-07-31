class EntriesController < ApplicationController

    # send all the data from the model/database to the index view
    # store all entries (which is my generated table) to an instance variable called ‘@entries’
    def index
        @entries = Entry.all
    end
 
    # built in method .new() to create a new instance of the Class Entry, which is the name of my generated model. 
    # This will let a user input a new entry to later save in the database.
    def new
        @entry = Entry.new()
    end
 
    # attempt to save the user’s submitted entry with the permitted parameters called ‘entry_params’. 
    # If the save is successful then the page will redirect to the root_url which will show our index page. 
    # If the save was unsuccessful then the page will re-render the new page where the user attempted to create a new entry.
    def create
        @entry = Entry.new(
            name: params[:entry][:name],
            age: params[:entry][:age]
            )
        if @entry.save
            redirect_to root_url
        else
            render :new
        end
    end
    
    def destroy
        @entry = Entry.find(params[:id])
        @entry.destroy
        redirect_to root_url
    end

    # method is private to ensure the method cannot be accessed by other places in the application which is great for security.
    private

    # It requires the specific parameter of entry (which is my model) and allows the user to upload a name to the database.
    def entry_params
        params.require(:entry).permit(:name)
        params.require(:entry).permit(:age)
    end
 
 
end
