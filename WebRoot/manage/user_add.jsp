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
							<b>添加成员</b>
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
							<form class="form-horizontal tabular-form margin-top-10" action="UserAddServlet" method="post">
								<div class="tab-content basic-info-scroll">
									<div class="tab-pane fade in active" id="basic-info">
										<div class="form-group">
											<label for="phone" class="col-sm-3 control-label">数量</label>
											<div class="col-sm-8 tabular-border">
												<input type="text" class="form-control" id="phone"
													placeholder="Phone" name="userNum" value=1>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">职务</label>
											<div class="col-sm-8 tabular-border">
												<select class="selector1 select2" name="userState">
													<option value=<%="管理员"%>>管理员</option>
													<option value=<%="志愿者"%>>志愿者</option>

												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">所属队伍</label>
											<div class="col-sm-8 tabular-border">
												<select class="selector1 select2" name="teamId">
													<%
														{
															TeamDao teamDao = new TeamDao();
															List<Team> list = teamDao.getTeamList();
															for (Team t : list) {
													%>
													<option value=<%=t.getTeamId()%>><%=t.getTeamName()%></option>
													<%
														}
														}
													%>

												</select>
											</div>
										</div>
									</div>


								</div>
								<!--TAB END-->

								<div class="form-actions">
									<button type="submit" class="btn btn-green btn-flat">添加</button>
								</div>

							</form>


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