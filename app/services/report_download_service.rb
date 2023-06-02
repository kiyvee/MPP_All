class ReportDownloadService

  def self.assemble_general_report(libraries, users)
    Prawn::Document.new do
          font_families.update(
            "Roboto" => {
              normal: Rails.root.join("app", "assets", "fonts", "Roboto-Regular.ttf"),
              medium: Rails.root.join("app", "assets", "fonts", "Roboto-Medium.ttf"),
              bold: Rails.root.join("app", "assets", "fonts", "Roboto-Bold.ttf")
            }
          )
          font "Roboto", size: 14

          text 'Libraries', align: :center
          libraries_table_data = [%w[ID Name Location Year]]
          libraries.each do |library|
            libraries_table_data << [library.id, library.name, library.location, library.year]
          end
          table(libraries_table_data, header: true, column_widths: [50, 150, 150, 50], row_colors: %w[FFFFFF DDDDDD])

          move_down 20
          text 'Users', align: :center
          users_table_data = [%w[Name Email Age]]
          users.each do |user|
            users_table_data << ["#{(user.name || "no name")} #{(user.surname || "no username")}", user.email, "#{user.age} y.o."]
          end
          table(users_table_data, header: true, column_widths: [200, 200, 50], row_colors: %w[FFFFFF DDDDDD])
        end
  end


  def self.assemble_report_user(user)
    Prawn::Document.new do
      font_families.update(
        "Roboto" => {
          normal: Rails.root.join("app", "assets", "fonts", "Roboto-Regular.ttf"),
          medium: Rails.root.join("app", "assets", "fonts", "Roboto-Medium.ttf"),
          bold: Rails.root.join("app", "assets", "fonts", "Roboto-Bold.ttf")
        }
      )
      font "Roboto", size: 14
      fill_color [255, 52, 65, 0]
      text 'User', align: :center
      text user.id.to_s
      text (user.name || "no name ") + (user.surname || "no surname")
      text user.email
      text user.age.to_s + " y.o."
    end
  end

  def self.assemble_report_lib(library)
    Prawn::Document.new do
      font_families.update(
        "Roboto" => {
          normal: Rails.root.join("app", "assets", "fonts", "Roboto-Regular.ttf"),
          medium: Rails.root.join("app", "assets", "fonts", "Roboto-Medium.ttf"),
          bold: Rails.root.join("app", "assets", "fonts", "Roboto-Bold.ttf")
        }
      )
      font "Roboto", size: 14
      fill_color [100, 50, 0, 0]
      text 'Library', align: :center
      image "#{Rails.root}/app/assets/images/linus.jpg", :width => 450
      text library.id.to_s
      text library.name
      text library.location
      text library.year.to_s
    end
  end

end
