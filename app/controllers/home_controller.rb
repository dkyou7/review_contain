class HomeController < ApplicationController
  # before_action :authenticate_user!, except: :index
  
  # 첫화면. 검색 창을 통해 사용자의 입력(user_input)을 받는 액션
    def index
          
    end
    
  #사이트에서 리뷰를 크롤링해와 DB에 저장/DB에서 user_input에 해당하는 정보를 검색한 후 저장/search_result로 돌려보냄
    def crawling
      
      
      @post =Post.new
      @post.userName = params[:user_input]
      @post.save
      

      
      
        require 'open-uri'
    
        @cr5p_review =Array.new
        
        1.upto(2) do |x|
          doc = Nokogiri::HTML(open("http://www.cr5p.com/board/board.html?code=wjsqh33_board2&page=3&board_cate=#board_list_target"))
          
          doc.css("div.bbs-table-list > table > tbody > tr > td").each do |c|
            @cr5p_review.push(c.inner_text)
          end
        end
        
      redirect_to '/search_result'
    end
    
  # crawling액션에서 받아온 정보를 뷰에 표시하는 액션  
    def search_result
      
    
    require 'open-uri'
    
    @cr5p_review =Array.new
    
   999392.upto(999400) do |x|
      doc = Nokogiri::HTML(open("http://www.cr5p.com/board/board.html?code=wjsqh33_board2&page=10&type=v&board_cate=&num1=#{x}&num2=00000&number=568&lock=N"))
         
      doc.css("div.bbs-table-view > table > tbody > tr > td > div.data-bd-cont").each do |c|
        @cr5p_review.push(c.inner_text)
      end
    end
    

     @styleberry_review =Array.new
    
    1.upto(2) do |x|
      doc = Nokogiri::HTML(open("http://www.dailymonday.com/board/power_review_photo.html"))
      
      doc.css("div.MS_power_review_list > ul > li > dl > dd > div.dsc > p").each do |c|
        @styleberry_review << c.inner_text
      end
    end
    
   
    
  end
    
  # 각각의 포스트를 보여주는 액션/찜하는 기능  
#   def post
#     @post=Post.find(params[:post_id])
#   end
  
  # 찜한 것을 모아서 보여주는 액션
  def my_cart
  end
    

end
