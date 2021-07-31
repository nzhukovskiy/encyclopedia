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
      if year / 10 % 10 < 10 or year / 10 % 10 > 20
        return "год"
      end
      return "лет"
    elsif year % 10 > 1 and year % 10 < 5
      if year / 10 % 10 < 10 or year / 10 % 10 > 20
        return "лет"
      else
        return "года"
      end
    else
      return "лет"
    end
  end
end
