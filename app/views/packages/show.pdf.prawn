pdf.text "Package ##{@package.mail_number}", :size => 30, :style => :bold
pdf.text "Mail Type: #{@package.mail_type}"
pdf.text "Description: #{@package.description}"
pdf.text "Date sent: #{@package.sent_date}"
pdf.text "Sender: #{@package.sender_name}"