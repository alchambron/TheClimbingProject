class CentersController < ApplicationController
  before_action :set_center, only: %i[show edit update destroy]

  # GET /centers or /centers.json
  def index
    # Récupère les coordonnées de la position de l'utilisateur depuis les paramètres du contrôleur
    user_lat = params[:latitude].to_f
    user_lng = params[:longitude].to_f
    # user_lat = 48.707622077530445
    # user_lng = 2.369391987758854

    centers = Center.all
    # Crée un tableau qui associe chaque salle d'escalade à sa distance à la position de l'utilisateur
    centers_with_distance =
 centers.map do |center|
   # Calcule la distance entre la position de l'utilisateur et les coordonnées de la salle
   distance = calculate_distance(user_lat, user_lng, center.latitude, center.longitude)

   # Retourne un objet qui associe la salle d'escalade à sa distance à la position de l'utilisateur
   { center: center, distance: distance }
 end

    # Trie le tableau en fonction de la propriété "distance"
    centers_with_distance.sort_by! { |center_with_distance| center_with_distance[:distance] }

    # Passe le tableau trié en tant qu'instance variable à la vue
    @centers_with_distance = centers_with_distance

    # centers = Center.all
    # @centers_with_distance = centers.map { |center| { center: center, distance: 2 } }
  end

  # GET /centers/1 or /centers/1.json
  def show
    @center = Center.find(params[:id])
  end

  # POST /centers or /centers.json
  def create
    @center = Center.new(center_params)

    respond_to do |format|
      if @center.save
        format.html { redirect_to(center_url(@center), notice: 'Center was successfully created.') }
        format.json { render(:show, status: :created, location: @center) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @center.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /centers/1 or /centers/1.json
  def update
    respond_to do |format|
      if @center.update(center_params)
        format.html { redirect_to(center_url(@center), notice: 'Center was successfully updated.') }
        format.json { render(:show, status: :ok, location: @center) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @center.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /centers/1 or /centers/1.json
  def destroy
    @center.destroy

    respond_to do |format|
      format.html { redirect_to(centers_url, notice: 'Center was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_center
    @center = Center.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def center_params
    params.require(:center).permit(:name)
  end

  # Fonction qui calcule la distance de Haversine entre deux points de coordonnées lat/lng
  def calculate_distance(lat1, lng1, lat2, lng2)
    # Convertit les angles en radians
    lat1_rad = lat1 * Math::PI / 180
    lng1_rad = lng1 * Math::PI / 180
    lat2_rad = lat2 * Math::PI / 180
    lng2_rad = lng2 * Math::PI / 180

    # Calcule la distance en utilisant la formule de Haversine
    a = (Math.sin((lat2_rad - lat1_rad) / 2)**2) + (Math.cos(lat1_rad) * Math.cos(lat2_rad) * (Math.sin((lng2_rad - lng1_rad) / 2)**2))
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    earth_radius = 6371 # Rayon de la Terre en km
    distance = earth_radius * c

    # Retourne la distance arrondie à une décimale
    return distance
  end
end
