class OpenDataController < ApplicationController
  def index
    @data = OpenData.where('phone = ? and grade <> ?', '2123439977', '').first.inspect
  end
end
