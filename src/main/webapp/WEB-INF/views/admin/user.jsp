<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
  <!--Main Navigation-->
  <!--Main layout-->
  <main style="margin-top: 58px">
    <div class="container pt-4">
      <!-- Section: Main chart -->
      <section class="mb-4">
        <div class="card">
          <div class="card-header py-3">
            <h5 class="mb-0 text-center"><strong>Tất cả bài viết</strong></h5>
          </div>
          <div class="table-responsive">
            <table class="table align-middle mb-0 bg-white">
                <thead class="bg-light">
                  <tr>
                    <th>Name</th>
                    <th>Title</th>
                    <th>Status</th>
                    <th>Position</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <div class="d-flex align-items-center">
                        <img
                            src="https://mdbootstrap.com/img/new/avatars/8.jpg"
                            alt=""
                            style="width: 45px; height: 45px"
                            class="rounded-circle"
                            />
                        <div class="ms-3">
                          <p class="fw-bold mb-1">John Doe</p>
                          <p class="text-muted mb-0">john.doe@gmail.com</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <p class="fw-normal mb-1">Software engineer</p>
                      <p class="text-muted mb-0">IT department</p>
                    </td>
                    <td>
                      <span class="badge badge-success rounded-pill d-inline">Active</span>
                    </td>
                    <td>Senior</td>
                    <td>
                      <button type="button" class="btn btn-link btn-sm btn-rounded">
                        Edit
                      </button>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="d-flex align-items-center">
                        <img
                            src="https://mdbootstrap.com/img/new/avatars/6.jpg"
                            class="rounded-circle"
                            alt=""
                            style="width: 45px; height: 45px"
                            />
                        <div class="ms-3">
                          <p class="fw-bold mb-1">Alex Ray</p>
                          <p class="text-muted mb-0">alex.ray@gmail.com</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <p class="fw-normal mb-1">Consultant</p>
                      <p class="text-muted mb-0">Finance</p>
                    </td>
                    <td>
                      <span class="badge badge-primary rounded-pill d-inline"
                            >Onboarding</span
                        >
                    </td>
                    <td>Junior</td>
                    <td>
                      <button
                              type="button"
                              class="btn btn-link btn-rounded btn-sm fw-bold"
                              data-mdb-ripple-color="dark"
                              >
                        Edit
                      </button>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="d-flex align-items-center">
                        <img
                            src="https://mdbootstrap.com/img/new/avatars/7.jpg"
                            class="rounded-circle"
                            alt=""
                            style="width: 45px; height: 45px"
                            />
                        <div class="ms-3">
                          <p class="fw-bold mb-1">Kate Hunington</p>
                          <p class="text-muted mb-0">kate.hunington@gmail.com</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <p class="fw-normal mb-1">Designer</p>
                      <p class="text-muted mb-0">UI/UX</p>
                    </td>
                    <td>
                      <span class="badge badge-warning rounded-pill d-inline">Awaiting</span>
                    </td>
                    <td>Senior</td>
                    <td>
                      <button
                              type="button"
                              class="btn btn-link btn-rounded btn-sm fw-bold"
                              data-mdb-ripple-color="dark"
                              >
                        Edit
                      </button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <nav aria-label="...">
                <ul class="pagination">
                  <li class="page-item disabled">
                    <a class="page-link">Previous</a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item active" aria-current="page">
                    <a class="page-link" href="#">2 <span class="visually-hidden">(current)</span></a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                  </li>
                </ul>
              </nav>
        </div>
      </section>
      <!-- Section: Main chart -->

      
    </div>
  </main>
  <!--Main layout-->
  <!-- MDB -->
  <script type="text/javascript" src="js/mdb.umd.min.js"></script>
  <!-- Custom scripts -->
  <script type="text/javascript" src="js/admin.js"></script>

</body>