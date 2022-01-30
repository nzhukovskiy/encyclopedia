module ArticlesHelper
  def create_links body_text
    text_arr = body_text.chars
    temp_arr = []
    flag = 0
    name_str = ""
    link_str = ""
    text_arr.each do |text_el|
      if text_el != "|" and text_el != "}"
        if flag == 1
          name_str += text_el
        elsif flag == 2
          link_str += text_el
        end
      end
      if text_el == "{"
        flag = 1
      elsif text_el == "|"
        flag = 2
      elsif text_el == "}"
        flag = 0
        temp_arr << {name: name_str, link: link_str}
        name_str = ""
        link_str = ""
      end

    end

    res_arr = ""
    k = 0
    f = 0
    text_arr.each do |el|
      if el != "|" and el != "{" and el != "}" and f == 0
        res_arr += el
      elsif el == "{"
        article = Article.find_by(title: temp_arr[k][:link])
        if article != nil
          res_arr += "<a href=\"" + article.id.to_s + "\">" + temp_arr[k][:name] + "</a>"
        else
          res_arr += "<a href=\"new\">" + temp_arr[k][:name] + "</a>"
        end

        k+=1
        f = 1
      elsif el == "}"
        f = 0
      end

    end
    res_arr
  end
end
