module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Lawyer Auction").join(" - ")
      end
    end
  end
end
