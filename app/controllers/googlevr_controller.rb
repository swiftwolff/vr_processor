class GooglevrController < ApplicationController
	protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json'}  #Rails 4
	# skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	def create
    #sound = Sound.new
    #
		 data= params[:audio]

     #goodies = data.tempfile.read()
     path = data.tempfile.path
     #data.rewind
     #p "*"*100
     #p data.inspect
     #data.tempfile.open()
     #goodies = data.tempfile.readlines()
    #sound.save
    #p "*"*200
    #p data
    #@sound = Sound.create(data)
    #
    #p @sound

    #file=File.new("output.mp3","w")
    #file.write(goodies)
    #file.flush
    #file.close
    #data.tempfile.close()

    #exec "sendgoogle.rb"
    filename = Pathname.new(path).basename.to_s
    #p path
    #p filename
    system("mv #{path} .")
    system("mv #{filename} output.mp3")
    system("ruby sendgoogle.rb")
    system("ffmpeg -i output.mp3 -y output.flac")
    system("python sendtogoogle.py")
    #p @message

    #render text: "Done!"

    render json: {"message"=>"Successful!"}

    #@response = {"message"=>"Successful!"}
    #respond_to do |format|
    #  	format.json {render :json => @response}
    #end
  end

end