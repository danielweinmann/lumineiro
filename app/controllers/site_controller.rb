class SiteController < ApplicationController

  layout 'site'

  def index
  end

  def mailee
    begin

      Mailee::Contact.create(:name => params[:name], :email => params[:email]).put(:subscribe, :list => 'Site')
      return render :json => { :ok => true, :msg => "Muito obrigado! Seus dados foram cadastrados com sucesso." }

    rescue

      begin
        contacts = Mailee::Contact.find(:all, :params => { :by_keyword => params[:email] })
        contacts.each do |contact|

          if contact.email == params[:email]
            begin
              contact.put(:subscribe, :list => 'Site')
            rescue
            end
            if params[:name] and not params[:name].empty? and not params[:name].blank?
              contact.name = params[:name]
              if contact.save
                return render :json => { :ok => true, :msg => "Muito obrigado! Seus dados foram atualizados com sucesso." }
              else
                return render :json => { :ok => false, :msg => "Oops. Ocorreu um erro ao atualizar seus dados." }
              end
            else
              return render :json => { :ok => true, :msg => "Muito obrigado! Seus dados foram atualizados com sucesso." }
            end
          end

        end

        return render :json => { :ok => false, :msg => "Oops. Ocorreu um erro ao cadastrar seus dados." }

      rescue
        return render :json => { :ok => false, :msg => "Oops. Ocorreu um erro ao cadastrar seus dados." }
      end

    end
  end

  def numbers
  end

  def history
  end

  def videos
  end

  def photo

    return render :text => nil unless params[:url]
    require 'nokogiri'
    response = HTTParty.get(params[:url])
    image_page = Nokogiri::HTML.parse(response.body)
    image = image_page.search('.photoImgDiv img').first
    response = HTTParty.get(image['src'])
    return send_data response.body, :type => 'image/jpeg', :disposition => 'inline'

  end

  def photos

    #return @urls = ["http://www.flickr.com/photos/30399665@N02/4235396869/", "http://www.flickr.com/photos/30399665@N02/4236173018/", "http://www.flickr.com/photos/30399665@N02/4236172926/"]

    require 'nokogiri'

    @urls = []

    response = HTTParty.get("http://www.flickr.com/photos/30399665@N02/")
    page = Nokogiri::HTML.parse(response.body)

    while page do
      page.search('.photo_container a').each do |link|
        @urls << "http://www.flickr.com#{link['href']}"
      end
      next_page = page.search('a.Next').first
      if next_page
        response = HTTParty.get("http://www.flickr.com#{next_page['href']}")
        page = Nokogiri::HTML.parse(response.body)
      else
        page = nil
      end
    end
  rescue
  end

  def sponsors
  end

  def contact
  end

end

