class SwipesController < ApplicationController
    before_action :set_swipe, only: %i[ show edit update destroy ]

    # GET /swipes or /swipes.json
    def index
      @swipes = Swipe.all
    end

    def swiper
      @random_user = User.joins("LEFT JOIN swipes ON users.id = swipes.swipee_id AND swipes.swiper_id = #{current_user.id}").where('swipes.id IS NULL').where.not(id: current_user.id).order('RANDOM()').first
    
    end

    def like
      @u = User.find(params[:id])

      create_like(@u)
      redirect_to "/swipe", notice: 'You liked the user!'
    end
  
    def dislike
      @u = User.find(params[:id])

      create_dislike(@u)
      redirect_to "/swipe", notice: 'You disliked the user!'
    end
  
    # GET /swipes/new
    def new
      @swipe = Swipe.new
    end

    def delete_my_swipes
      Swipe.where(swiper_id: current_user.id)
      redirect_to '/', notice: 'My swipes deleted!'
    end

    def delete_all_swipes
      Swipe.destroy_all
      redirect_to '/', notice: 'All swipes deleted!'
    end

    # POST /swipes or /swipes.json
    def create
      @swipe = Swipe.new(swipe_params)
  
      respond_to do |format|
        if @swipe.save
          format.html { redirect_to swipe_url(@swipe), notice: "Swipe was successfully created." }
          format.json { render :show, status: :created, location: @swipe }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @swipe.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /swipes/1 or /swipes/1.json
    def update
      respond_to do |format|
        if @swipe.update(swipe_params)
          format.html { redirect_to swipe_url(@swipe), notice: "Swipe was successfully updated." }
          format.json { render :show, status: :ok, location: @swipe }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @swipe.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /swipes/1 or /swipes/1.json
    def destroy
      @swipe.destroy
  
      respond_to do |format|
        format.html { redirect_to swipes_url, notice: "Swipe was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_swipe
        @swipe = Swipe.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def swipe_params
        params.require(:swipe).permit(:swiper_id,:swipee_id,:liked)
      end



      def create_like(user)
        Swipe.create(swiper_id: current_user.id, swipee_id: user.id, liked: true)
        create_match(user)
      end

      def create_dislike(user)
        Swipe.create(swiper_id: current_user.id, swipee_id: user.id, liked: false)
      end

      def create_match(user)

        # Check if the other user has liked the current user
        if Swipe.exists?(swiper_id: user.id, swipee_id: current_user.id, liked: true)
          # Check if the current user has liked the other user
          if Swipe.exists?(swiper_id: current_user.id, swipee_id: user.id, liked: true)
            # Both users liked each other, create a match
            Match.create(user1_id: current_user.id, user2_id: user.id)

          end
        end
      end
end
