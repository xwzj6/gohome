<%@ page language="java"
	import="java.util.*,com.zufe.dao.*,com.zufe.bean.*"
	pageEncoding="UTF-8"%>
<div class="modal modal-pull-right" data-easein="fadeInRight"
	data-easeout="fadeOutRight" id="modal-pull-right-add" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row modal-close">
					<div class="col-md-12 padding-bottom-8 padding-top-8 bg-silver">
						
						
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">

						<div class="user-add-content">
							 <h4 class="margin-left-10">全部省份信息总览</h4>
							<!--TAB START-->
							<table class="countries_list wow zoomIn">
                                                    <tbody>
                                                    <%{
                                                    	ProvinceInfo provinceInfo=new ProvinceInfo();
                                                    	ProvinceDao provinceDao=new ProvinceDao();
                                                    	for(int i=1;i<=34;i++){
                                                    		provinceInfo=provinceDao.getProvinceInfoByProvinceId(i);
                                                    		String name=provinceDao.getProvinceNameById(i);
                                                     %>
                                                        <tr>
                                                        <th>
                                                                
                                                                </th>
                                                            	<div>
                                                            	<p><%=name %></p>
                                                                    <p class="badge bg-lightgray fg-gray">男性成员<span class="counter"><%=provinceInfo.getMen() %></span></p>
                                                             	<p class="badge bg-lightgray fg-gray">女性成员<span class="counter"><%=provinceInfo.getWomen() %></span></p>
                                                                <p class="badge bg-lightgray fg-gray">队伍数量<span class="counter"><%=provinceInfo.getTeam() %></span></p>
                                                             	<p class="badge bg-lightgray fg-gray">报案数量<span class="counter"><%=provinceInfo.getLost() %></span></p>
                                                          
                                                             	<p class="badge bg-lightgray fg-gray">完成数量<span class="counter"><%=provinceInfo.getLostFound() %></span></p>
                                                                  
                                                                </div>
                                                            <td >
                                                                
                                                             </td>
                                                        </tr>
                                                        <%}} %>
                                                        
                                                        
                                                    </tbody>
                                                </table>


						</div>
						<!--/user-add-content-->

					</div>
					<!--/col-md-12-->
				</div>
				<!--/row-->
			</div>
		</div>
	</div>
</div>