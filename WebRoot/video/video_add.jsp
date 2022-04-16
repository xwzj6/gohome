<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="modal modal-pull-right" data-easein="fadeInRight"
	data-easeout="fadeOutRight" id="modal-pull-right-add" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row modal-close">
					<div class="col-md-12 padding-bottom-8 padding-top-8 bg-silver">
						<h4 class="pull-left">
							<b>上传视频</b>
						</h4>
						<ul class="list-unstyled list-inline text-right">
							<li class="close-right-modal"><span
								class="fa fa-times fa-2x" data-dismiss="modal"></span></li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">

						<div class="user-add-content">

							<!--TAB START-->
								<form class="form-horizontal tabular-form margin-top-10"  action="AddVideoServlet?userId=<%=user.getUserId() %>" method="post"  enctype="multipart/form-data">
								
							<div class="tab-content basic-info-scroll">
									<div class="tab-pane fade in active" id="basic-info">
										<div class="form-group">
											<label for="name" class="col-sm-2 control-label">视频名称</label>
											<div class="col-sm-10 tabular-border">
												<input type="text" class="form-control" id="name" name="videoName"
													placeholder="Full Name">
											</div>
										</div>
										
										<div class="form-group" style="height:50px;">
											<label for="address" class="col-sm-2 control-label">封面</label>
											<div class="fallback">
												<input name="pic" type="file" multiple />
											</div>
										</div>
										<div class="form-group" style="height:50px;">
											<label for="address" class="col-sm-2 control-label">视频</label>
											<div class="fallback">
												<input name="upload" type="file" multiple />
											</div>
										</div>
									</div>
									</div>
									<div class="form-actions">
										<button type="submit" class="btn btn-green btn-flat">上传</button>
									</div>
								</form>


							


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