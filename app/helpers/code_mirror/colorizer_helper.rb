require 'coderay'

module CodeMirror::ColorizerHelper

  def colorize_code(text)
    CodeRay.scan(text, :ruby).div(line_numbers: :table).html_safe
  end

end
