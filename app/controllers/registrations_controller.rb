class RegistrationsController < Devise::RegistrationsController


    def create
  
      if sign_up_params[:role]=='user'
        @stud = Student.find_by_email(sign_up_params[:email])
        if @stud.nil?
          @stud = Student.new(email: sign_up_params[:email], name: params[:user][:student][:name],
                              password: sign_up_params[:password], education: params[:user][:student][:education],
                              university: params[:user][:student][:university], max_books:2, fines: 0)
          if @stud.save
            if(@stud[:education]=="Masters")
              @stud.update({max_books:4})
            elsif (@stud[:education]=="PhD")
              @stud.update({max_books:6})
            else
              @stud.update({max_books:2})
            end
          end
          super and return
          # redirect_to :student and return
        else
          # @stud.update(student_signup_params)
          # format.html { redirect_to students_path, notice: 'Student was successfully created.' }
          # format.json { render :show, status: :created, location: @student }
        end
      elsif sign_up_params[:role]=='librarian'
        @lib = Librarian.find_by_email(sign_up_params[:email])
        if(@lib.nil?)
          @lib = Librarian.new(email: sign_up_params[:email], name: params[:user][:librarian][:name],
                               password: sign_up_params[:password], libraries_id: params[:user][:librarian][:libraries_id],
                               approved: false)
          @lib.save
          redirect_to new_user_session_path, :flash=>{:alert => 'Request has been sent. Pending admin approval.'}
          # format.json { render :show, status: :accepted, location: home_index_path}
        else
          # @lib.update(librarian_signup_parmas)
          # format.html { redirect_to librarians_path, notice: 'Student was successfully created.' }
          # format.json { render :show, status: :created, location: @librarian }
        end
      else
        redirect_to new_user_session_path, :flash =>{:alert =>'Redirected to user homepage.'}
      end