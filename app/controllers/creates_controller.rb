class CreatesController < ApplicationController
  def create_cakes
    	Colleague.all.each do |colleague|
    		cake = Cake.find_or_create_by(name: colleague.pastry)
        cake.selectioned= false
        colleague.selectioned=false
        cake.save

        colleague.cake_id = cake.name
      end
    end

  def reinit
      Cake.update_all(selectioned: false)
      Colleague.update_all(selectioned: false)
  end

  def index
    @cakes = Cake.all
  end

  def linguini
    @unselected_cakes = Cake.where(selectioned: false)
    @selected_cakes = Cake.where(selectioned: true)
    @cakes = Cake.all
  end



  def selection
    @chosen = params[:lchosen_cakes]
    @chosen.each do |cake|
      Cake.where(name: cake).update_all(selectioned: true)
      Colleague.where(pastry: cake).update_all(selectioned: true)
      puts cake
    end
    redirect_to "/linguini"
  end

  def chief_of_happiness
    @count=0
    @selected_cakes = Cake.where(selectioned: true)
    @colleagues_no_option = Colleague.where(selectioned: true)
  end

  def cselection
    @cakes = Cake.where(selectioned: true)
    Colleague.update_all(selectioned: false)

    if params[:Financier]
      Colleague.where(name: params[:Financier]).update(selectioned: true)
    end
    if params[:Cookies]
      Colleague.where(name: params[:Cookies]).update_all(selectioned: true, details: params[:pepites])
      @pepites = params[:pepites]
    end
    if Cake.where(name: "Cornes de gazelle", selectioned: true)
      Colleague.where(pastry: "Cornes de gazelle").update_all(selectioned: true)
    end
    if params[:Churros]
      Colleague.where(name: params[:Churros]).update_all(selectioned: true)
    end
    if params[:Flan]
      Colleague.where(name: params[:Flan]).update_all(selectioned: true)
    end
    if params[:fruits]
      Colleague.where(name: params[:fruits]).update_all(selectioned: true)
    end
  # Colleague.where.not(name: params[:cake]).update_all(selectioned: false)
    redirect_to "/result"
  end

  def result
    @selected_cakes = Cake.where(selectioned: true)
    @selected_colleagues = Colleague.where(selectioned: true)
  end
end
