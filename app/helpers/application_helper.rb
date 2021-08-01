module ApplicationHelper
  def less_text(txt, n)
    if txt != nil

      t = txt[0...n].strip()
      t+="..." if txt.length>n
      return t

    end
  end

  def year_helper(year)
    if year % 10 == 1
      if year / 10 % 10 < 1 or year / 10 % 10 >= 2
        return "год"
      end
      return "лет"
    elsif year % 10 > 1 and year % 10 < 5

      if year / 10 % 10 < 1 or year / 10 % 10 >= 2
        return "года"
      else
        return "лет"
      end
    else
      return "лет"
    end
  end

  def date_to_words (date)
    str = ""
    str += date.day.to_s + " " + ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября",
                                  "октября", "ноября", "декабря"].at(date.month-1) + " " + date.year.to_s + " года"
    #str += date.day.to_s
    #str += " "
    #names = ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"]
    #str += names[date.month-1]
    #str += " "
    #str += date.year.to_s
    #str += " "
    #str += "года"
    return str
  end
end
