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
						<h4 class="pull-left">
							<b>添加队伍</b>
						</h4>
						<ul class="list-unstyled list-inline text-right">
							<li class="close-right-modal"><span
								class="fa fa-times fa-2x" data-dismiss="modal"></span>
							</li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">

						<div class="user-add-content">

							<!--TAB START-->
							<div class="tab-content basic-info-scroll">
								<div class="tab-pane fade in active" id="basic-info">
									<form action="TeamAddServlet" method="post"
										class="form-horizontal tabular-form margin-top-10">


										<div class="form-group">
											<label for="name" class="col-sm-4 control-label">队伍名称</label>
											<div class="col-sm-10 tabular-border">
												<input type="text" class="form-control" id="name"
													placeholder="Full Name" name="teamName">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label">所属省份</label>
											<div class="col-sm-10 tabular-border">
												<select name="teamProvince" class="selector1 select2">
													<%
														{
															ProvinceDao provinceDao = new ProvinceDao();
															for (int i = 1; i <= 34; i++) {
																String name = provinceDao.getProvinceNameById(i);
													%>
													<option value=<%=name%>><%=name%></option>
													<%
														}
														}
													%>
												</select>
											</div>

										</div>
										<div class="form-actions">
											<button type="submit" class="btn btn-green btn-flat">添加</button>
										</div>

									</form>


								</div>


							</div>
							<!--TAB END-->






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