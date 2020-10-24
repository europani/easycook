<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
  <body class="goto-here">

    <section class="ftco-section ftco-cart">
   <jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
         <div class="container">
         <h2>장바구니</h2>
           <hr>
           <br>
            <div class="row">
             <div class="col-md-12 ftco-animate">
                <div class="cart-list">
                   <table class="table">
                      <thead class="thead-primary">
                        <tr class="text-center">
                              <th>&nbsp;</th>
                              <th>상품목록</th>
                              <th>&nbsp;</th>
                              <th>가격</th>
                              <th>수량</th>
                              <th>총액</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr class="text-center">
                          <td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
                          
                          <td class="image-prod"><div class="img" style="background-image:url(../resources/images/product-3.jpg);"></div></td>
                          
                          <td class="product-name">
                             <h3>Bell Pepper</h3>
                             <p>Far far away, behind the word mountains, far from the countries</p>
                          </td>
                          
                          <td class="price">$4.90</td>
                          
                          <td class="quantity">
                             <div class="input-group mb-3">
                               <input type="text" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100">
                            </div>
                         </td>
                          
                          <td class="total">$4.90</td>
                        </tr><!-- END TR-->

                        <tr class="text-center">
                          <td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
                          
                          <td class="image-prod"><div class="img" style="background-image:url(../resources/images/product-4.jpg);"></div></td>
                          
                          <td class="product-name">
                             <h3>Bell Pepper</h3>
                             <p>Far far away, behind the word mountains, far from the countries</p>
                          </td>
                          
                          <td class="price">$15.70</td>
                          
                          <td class="quantity">
                             <div class="input-group mb-3">
                               <input type="text" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100">
                            </div>
                         </td>
                          
                          <td class="total">$15.70</td>
                        </tr><!-- END TR-->
                      </tbody>
                    </table>
                 </div>
             </div>
          </div>
          <div class="mouse">
               <a href="#" class="mouse-icon">
                  <div class="mouse-wheel">
                     <span class="ion-ios-arrow-up"></span>
                  </div>
               </a>
         </div>
</section>
  <script>
      $(document).ready(function(){

      var quantitiy=0;
         $('.quantity-right-plus').click(function(e){
              
              // Stop acting like a button
              e.preventDefault();
              // Get the field name
              var quantity = parseInt($('#quantity').val());
              
              // If is not undefined
                  
                  $('#quantity').val(quantity + 1);

                
                  // Increment
              
          });

           $('.quantity-left-minus').click(function(e){
              // Stop acting like a button
              e.preventDefault();
              // Get the field name
              var quantity = parseInt($('#quantity').val());
              
              // If is not undefined
            
                  // Increment
                  if(quantity>0){
                  $('#quantity').val(quantity - 1);
                  }
          });
          
      });
      
   </script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />