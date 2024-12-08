module ApplicationHelper
  def modal_form_builder(form, builder, lable=true)
    builder.except!(:additional)
    html_content = String.new
    builder.each do |field, type|
      html_content += "<div class='mb-3'>"

      if lable
          html_content += form.label field.to_sym, "#{field.to_s.titleize}:", class: 'col-form-label'
      end

      case type
      when :string
        html_content += form.text_field field.to_sym, class: 'form-control', value: ""
      when :text
        html_content += form.text_area field.to_sym, class: 'form-control', value: ""
      else
        raise "Invalid type #{type}"
      end

      html_content += "</div>"
    end
    html_content.html_safe
  end
end
