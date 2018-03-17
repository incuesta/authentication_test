class IdolPdf < Prawn::Document



	def initialize(idols, the_view_context)
		super(top_margin: 70)

		@idols = idols

		# Pass the view_context so that we'll have access to the ViewHelpers
		@view_context = the_view_context


		momo
		see_idols
		cutie_maiyan
		text_content

	end




	def momo
		text "Jeorojima...#{@idols.first.last_name}", size: 15, style: :bold
	end




	def see_idols
		move_down 30

		table idols_data do 
			row(0).font_style = :bold
			columns(1..2).align = :right
			self.row_colors = ['DDDDDD', 'FFFFFF']
			self.header = true
		end
	end




	# Multi-dimensional array for table
	def idols_data

		[[ "Last name", "First name", "Description"  ]] + [[ @view_context.number_to_currency(1), 2, 3] ] +
		@idols.map { |idol|  [idol.last_name, idol.first_name, idol.talents.first.description]  }

	end




	def cutie_maiyan
		move_down 30

	    #This inserts an image in the pdf file and sets the size of the image
	    image "#{Rails.root}/app/assets/images/mai.jpg", height: 300
  	end




	def text_content
	    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
	    y_position = cursor - 50

	    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
	    bounding_box([0, y_position], :width => 270, :height => 300) do
	      text "Lorem ipsum", size: 15, style: :bold
	      text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum semper placerat. Aenean mattis fringilla risus ut fermentum. Fusce posuere dictum venenatis. Aliquam id tincidunt ante, eu pretium eros. Sed eget risus a nisl aliquet scelerisque sit amet id nisi. Praesent porta molestie ipsum, ac commodo erat hendrerit nec."
	    end

	    bounding_box([300, y_position], :width => 270, :height => 300) do
	      text "Duis vel", size: 15, style: :bold
	      text "Duis vel tortor elementum, ultrices tortor vel, accumsan dui. Nullam in dolor rutrum, gravida turpis eu, vestibulum lectus. Pellentesque aliquet dignissim justo ut fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut venenatis massa non eros venenatis aliquet. Suspendisse potenti. Mauris sed tincidunt mauris, et vulputate risus."
	    end

	end

end