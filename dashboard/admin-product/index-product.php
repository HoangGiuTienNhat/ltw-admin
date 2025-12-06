<!doctype html>
<!--
* Tabler - Premium and Open Source dashboard template with responsive and high quality UI.
* @version 1.4.0
* @link https://tabler.io
* Copyright 2018-2025 The Tabler Authors
* Copyright 2018-2025 codecalm.net Paweł Kuna
* Licensed under MIT (https://github.com/tabler/tabler/blob/master/LICENSE)
-->
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Dashboard - Tabler - Premium and Open Source dashboard template with responsive and high quality UI.</title>
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="../dist/libs/jsvectormap/dist/jsvectormap.css?1760059270" rel="stylesheet" />
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="../dist/css/tabler.css?1760059270" rel="stylesheet" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PLUGINS STYLES -->
    <link href="../dist/css/tabler-flags.css?1760059270" rel="stylesheet" />
    <link href="../dist/css/tabler-socials.css?1760059270" rel="stylesheet" />
    <link href="../dist/css/tabler-payments.css?1760059270" rel="stylesheet" />
    <link href="../dist/css/tabler-vendors.css?1760059270" rel="stylesheet" />
    <link href="../dist/css/tabler-marketing.css?1760059270" rel="stylesheet" />
    <link href="../dist/css/tabler-themes.css?1760059270" rel="stylesheet" />
    <!-- END PLUGINS STYLES -->
    <!-- BEGIN DEMO STYLES -->
    <link href="../preview/css/demo.css?1760059270" rel="stylesheet" />
    <!-- END DEMO STYLES -->
    <!-- BEGIN CUSTOM FONT -->
    <style>
      @import url("https://rsms.me/inter/inter.css");
    </style>
    <!-- END CUSTOM FONT -->
  </head>
  <body>
    <!-- BEGIN GLOBAL THEME SCRIPT -->
    <script src="../dist/js/tabler-theme.min.js?1760059270"></script>
    <!-- END GLOBAL THEME SCRIPT -->
    <div class="page">
      <!-- BEGIN NAVBAR  -->
      <header class="navbar navbar-expand-md d-print-none">
        <div class="container-xl">
          <!-- BEGIN NAVBAR TOGGLER -->
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbar-menu"
            aria-controls="navbar-menu"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <!-- END NAVBAR TOGGLER -->
          <!-- BEGIN NAVBAR LOGO -->
          <div class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
            <a href="../" aria-label="Tabler"
              ><svg xmlns="http://www.w3.org/2000/svg" width="110" height="32" viewBox="0 0 232 68" class="navbar-brand-image">
                <path
                  d="M64.6 16.2C63 9.9 58.1 5 51.8 3.4 40 1.5 28 1.5 16.2 3.4 9.9 5 5 9.9 3.4 16.2 1.5 28 1.5 40 3.4 51.8 5 58.1 9.9 63 16.2 64.6c11.8 1.9 23.8 1.9 35.6 0C58.1 63 63 58.1 64.6 51.8c1.9-11.8 1.9-23.8 0-35.6zM33.3 36.3c-2.8 4.4-6.6 8.2-11.1 11-1.5.9-3.3.9-4.8.1s-2.4-2.3-2.5-4c0-1.7.9-3.3 2.4-4.1 2.3-1.4 4.4-3.2 6.1-5.3-1.8-2.1-3.8-3.8-6.1-5.3-2.3-1.3-3-4.2-1.7-6.4s4.3-2.9 6.5-1.6c4.5 2.8 8.2 6.5 11.1 10.9 1 1.4 1 3.3.1 4.7zM49.2 46H37.8c-2.1 0-3.8-1-3.8-3s1.7-3 3.8-3h11.4c2.1 0 3.8 1 3.8 3s-1.7 3-3.8 3z"
                  fill="#066fd1"
                  style="fill: var(--tblr-primary, #066fd1)"
                />
                <path
                  d="M105.8 46.1c.4 0 .9.2 1.2.6s.6 1 .6 1.7c0 .9-.5 1.6-1.4 2.2s-2 .9-3.2.9c-2 0-3.7-.4-5-1.3s-2-2.6-2-5.4V31.6h-2.2c-.8 0-1.4-.3-1.9-.8s-.9-1.1-.9-1.9c0-.7.3-1.4.8-1.8s1.2-.7 1.9-.7h2.2v-3.1c0-.8.3-1.5.8-2.1s1.3-.8 2.1-.8 1.5.3 2 .8.8 1.3.8 2.1v3.1h3.4c.8 0 1.4.3 1.9.8s.8 1.2.8 1.9-.3 1.4-.8 1.8-1.2.7-1.9.7h-3.4v13c0 .7.2 1.2.5 1.5s.8.5 1.4.5c.3 0 .6-.1 1.1-.2.5-.2.8-.3 1.2-.3zm28-20.7c.8 0 1.5.3 2.1.8.5.5.8 1.2.8 2.1v20.3c0 .8-.3 1.5-.8 2.1-.5.6-1.2.8-2.1.8s-1.5-.3-2-.8-.8-1.2-.8-2.1c-.8.9-1.9 1.7-3.2 2.4-1.3.7-2.8 1-4.3 1-2.2 0-4.2-.6-6-1.7-1.8-1.1-3.2-2.7-4.2-4.7s-1.6-4.3-1.6-6.9c0-2.6.5-4.9 1.5-6.9s2.4-3.6 4.2-4.8c1.8-1.1 3.7-1.7 5.9-1.7 1.5 0 3 .3 4.3.8 1.3.6 2.5 1.3 3.4 2.1 0-.8.3-1.5.8-2.1.5-.5 1.2-.7 2-.7zm-9.7 21.3c2.1 0 3.8-.8 5.1-2.3s2-3.4 2-5.7-.7-4.2-2-5.8c-1.3-1.5-3-2.3-5.1-2.3-2 0-3.7.8-5 2.3-1.3 1.5-2 3.5-2 5.8s.6 4.2 1.9 5.7 3 2.3 5.1 2.3zm32.1-21.3c2.2 0 4.2.6 6 1.7 1.8 1.1 3.2 2.7 4.2 4.7s1.6 4.3 1.6 6.9-.5 4.9-1.5 6.9-2.4 3.6-4.2 4.8c-1.8 1.1-3.7 1.7-5.9 1.7-1.5 0-3-.3-4.3-.9s-2.5-1.4-3.4-2.3v.3c0 .8-.3 1.5-.8 2.1-.5.6-1.2.8-2.1.8s-1.5-.3-2.1-.8c-.5-.5-.8-1.2-.8-2.1V18.9c0-.8.3-1.5.8-2.1.5-.6 1.2-.8 2.1-.8s1.5.3 2.1.8c.5.6.8 1.3.8 2.1v10c.8-1 1.8-1.8 3.2-2.5 1.3-.7 2.8-1 4.3-1zm-.7 21.3c2 0 3.7-.8 5-2.3s2-3.5 2-5.8-.6-4.2-1.9-5.7-3-2.3-5.1-2.3-3.8.8-5.1 2.3-2 3.4-2 5.7.7 4.2 2 5.8c1.3 1.6 3 2.3 5.1 2.3zm23.6 1.9c0 .8-.3 1.5-.8 2.1s-1.3.8-2.1.8-1.5-.3-2-.8-.8-1.3-.8-2.1V18.9c0-.8.3-1.5.8-2.1s1.3-.8 2.1-.8 1.5.3 2 .8.8 1.3.8 2.1v29.7zm29.3-10.5c0 .8-.3 1.4-.9 1.9-.6.5-1.2.7-2 .7h-15.8c.4 1.9 1.3 3.4 2.6 4.4 1.4 1.1 2.9 1.6 4.7 1.6 1.3 0 2.3-.1 3.1-.4.7-.2 1.3-.5 1.8-.8.4-.3.7-.5.9-.6.6-.3 1.1-.4 1.6-.4.7 0 1.2.2 1.7.7s.7 1 .7 1.7c0 .9-.4 1.6-1.3 2.4-.9.7-2.1 1.4-3.6 1.9s-3 .8-4.6.8c-2.7 0-5-.6-7-1.7s-3.5-2.7-4.6-4.6-1.6-4.2-1.6-6.6c0-2.8.6-5.2 1.7-7.2s2.7-3.7 4.6-4.8 3.9-1.7 6-1.7 4.1.6 6 1.7 3.4 2.7 4.5 4.7c.9 1.9 1.5 4.1 1.5 6.3zm-12.2-7.5c-3.7 0-5.9 1.7-6.6 5.2h12.6v-.3c-.1-1.3-.8-2.5-2-3.5s-2.5-1.4-4-1.4zm30.3-5.2c1 0 1.8.3 2.4.8.7.5 1 1.2 1 1.9 0 1-.3 1.7-.8 2.2-.5.5-1.1.8-1.8.7-.5 0-1-.1-1.6-.3-.2-.1-.4-.1-.6-.2-.4-.1-.7-.1-1.1-.1-.8 0-1.6.3-2.4.8s-1.4 1.3-1.9 2.3-.7 2.3-.7 3.7v11.4c0 .8-.3 1.5-.8 2.1-.5.6-1.2.8-2.1.8s-1.5-.3-2.1-.8c-.5-.6-.8-1.3-.8-2.1V28.8c0-.8.3-1.5.8-2.1.5-.6 1.2-.8 2.1-.8s1.5.3 2.1.8c.5.6.8 1.3.8 2.1v.6c.7-1.3 1.8-2.3 3.2-3 1.3-.7 2.8-1 4.3-1z"
                  fill-rule="evenodd"
                  clip-rule="evenodd"
                  fill="#4a4a4a"
                /></svg
            ></a>
          </div>
          <!-- END NAVBAR LOGO -->
          <div class="navbar-nav flex-row order-md-last">
            <div class="nav-item d-none d-md-flex me-3">
              <div class="btn-list">
                <a href="https://github.com/tabler/tabler" class="btn btn-5" target="_blank" rel="noreferrer">
                  <!-- Download SVG icon from http://tabler.io/icons/icon/brand-github -->
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="icon icon-2"
                  >
                    <path
                      d="M9 19c-4.3 1.4 -4.3 -2.5 -6 -3m12 5v-3.5c0 -1 .1 -1.4 -.5 -2c2.8 -.3 5.5 -1.4 5.5 -6a4.6 4.6 0 0 0 -1.3 -3.2a4.2 4.2 0 0 0 -.1 -3.2s-1.1 -.3 -3.5 1.3a12.3 12.3 0 0 0 -6.2 0c-2.4 -1.6 -3.5 -1.3 -3.5 -1.3a4.2 4.2 0 0 0 -.1 3.2a4.6 4.6 0 0 0 -1.3 3.2c0 4.6 2.7 5.7 5.5 6c-.6 .6 -.6 1.2 -.5 2v3.5"
                    />
                  </svg>
                  Source code
                </a>
                <a href="https://github.com/sponsors/codecalm" class="btn btn-6" target="_blank" rel="noreferrer">
                  <!-- Download SVG icon from http://tabler.io/icons/icon/heart -->
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="icon text-pink icon-2"
                  >
                    <path d="M19.5 12.572l-7.5 7.428l-7.5 -7.428a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572" />
                  </svg>
                  Sponsor
                </a>
              </div>
            </div>
            <div class="d-none d-md-flex">
              <div class="nav-item">
                <a href="?theme=dark" class="nav-link px-0 hide-theme-dark" title="Enable dark mode" data-bs-toggle="tooltip" data-bs-placement="bottom">
                  <!-- Download SVG icon from http://tabler.io/icons/icon/moon -->
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="icon icon-1"
                  >
                    <path d="M12 3c.132 0 .263 0 .393 0a7.5 7.5 0 0 0 7.92 12.446a9 9 0 1 1 -8.313 -12.454z" />
                  </svg>
                </a>
                <a href="?theme=light" class="nav-link px-0 hide-theme-light" title="Enable light mode" data-bs-toggle="tooltip" data-bs-placement="bottom">
                  <!-- Download SVG icon from http://tabler.io/icons/icon/sun -->
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="icon icon-1"
                  >
                    <path d="M12 12m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0" />
                    <path d="M3 12h1m8 -9v1m8 8h1m-9 8v1m-6.4 -15.4l.7 .7m12.1 -.7l-.7 .7m0 11.4l.7 .7m-12.1 -.7l-.7 .7" />
                  </svg>
                </a>
              </div>
              <div class="nav-item dropdown d-none d-md-flex">
                <a
                  href="#"
                  class="nav-link px-0"
                  data-bs-toggle="dropdown"
                  tabindex="-1"
                  aria-label="Show notifications"
                  data-bs-auto-close="outside"
                  aria-expanded="false"
                >
                  <!-- Download SVG icon from http://tabler.io/icons/icon/bell -->
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="icon icon-1"
                  >
                    <path d="M10 5a2 2 0 1 1 4 0a7 7 0 0 1 4 6v3a4 4 0 0 0 2 3h-16a4 4 0 0 0 2 -3v-3a7 7 0 0 1 4 -6" />
                    <path d="M9 17v1a3 3 0 0 0 6 0v-1" />
                  </svg>
                  <span class="badge bg-red"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-end dropdown-menu-card">
                  <div class="card">
                    <div class="card-header d-flex">
                      <h3 class="card-title">Notifications</h3>
                      <div class="btn-close ms-auto" data-bs-dismiss="dropdown"></div>
                    </div>
                    <div class="list-group list-group-flush list-group-hoverable">
                      <div class="list-group-item">
                        <div class="row align-items-center">
                          <div class="col-auto"><span class="status-dot status-dot-animated bg-red d-block"></span></div>
                          <div class="col text-truncate">
                            <a href="#" class="text-body d-block">Example 1</a>
                            <div class="d-block text-secondary text-truncate mt-n1">Change deprecated html tags to text decoration classes (#29604)</div>
                          </div>
                          <div class="col-auto">
                            <a href="#" class="list-group-item-actions">
                              <!-- Download SVG icon from http://tabler.io/icons/icon/star -->
                              <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="icon text-muted icon-2"
                              >
                                <path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z" />
                              </svg>
                            </a>
                          </div>
                        </div>
                      </div>
                      <div class="list-group-item">
                        <div class="row align-items-center">
                          <div class="col-auto"><span class="status-dot d-block"></span></div>
                          <div class="col text-truncate">
                            <a href="#" class="text-body d-block">Example 2</a>
                            <div class="d-block text-secondary text-truncate mt-n1">justify-content:between ⇒ justify-content:space-between (#29734)</div>
                          </div>
                          <div class="col-auto">
                            <a href="#" class="list-group-item-actions show">
                              <!-- Download SVG icon from http://tabler.io/icons/icon/star -->
                              <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="icon text-yellow icon-2"
                              >
                                <path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z" />
                              </svg>
                            </a>
                          </div>
                        </div>
                      </div>
                      <div class="list-group-item">
                        <div class="row align-items-center">
                          <div class="col-auto"><span class="status-dot d-block"></span></div>
                          <div class="col text-truncate">
                            <a href="#" class="text-body d-block">Example 3</a>
                            <div class="d-block text-secondary text-truncate mt-n1">Update change-version.js (#29736)</div>
                          </div>
                          <div class="col-auto">
                            <a href="#" class="list-group-item-actions">
                              <!-- Download SVG icon from http://tabler.io/icons/icon/star -->
                              <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="icon text-muted icon-2"
                              >
                                <path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z" />
                              </svg>
                            </a>
                          </div>
                        </div>
                      </div>
                      <div class="list-group-item">
                        <div class="row align-items-center">
                          <div class="col-auto"><span class="status-dot status-dot-animated bg-green d-block"></span></div>
                          <div class="col text-truncate">
                            <a href="#" class="text-body d-block">Example 4</a>
                            <div class="d-block text-secondary text-truncate mt-n1">Regenerate package-lock.json (#29730)</div>
                          </div>
                          <div class="col-auto">
                            <a href="#" class="list-group-item-actions">
                              <!-- Download SVG icon from http://tabler.io/icons/icon/star -->
                              <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="icon text-muted icon-2"
                              >
                                <path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z" />
                              </svg>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="row">
                        <div class="col">
                          <a href="#" class="btn btn-2 w-100"> Archive all </a>
                        </div>
                        <div class="col">
                          <a href="#" class="btn btn-2 w-100"> Mark all as read </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="nav-item dropdown d-none d-md-flex me-3">
                <a
                  href="#"
                  class="nav-link px-0"
                  data-bs-toggle="dropdown"
                  tabindex="-1"
                  aria-label="Show app menu"
                  data-bs-auto-close="outside"
                  aria-expanded="false"
                >
                  <!-- Download SVG icon from http://tabler.io/icons/icon/apps -->
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="icon icon-1"
                  >
                    <path d="M4 4m0 1a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v4a1 1 0 0 1 -1 1h-4a1 1 0 0 1 -1 -1z" />
                    <path d="M4 14m0 1a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v4a1 1 0 0 1 -1 1h-4a1 1 0 0 1 -1 -1z" />
                    <path d="M14 14m0 1a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v4a1 1 0 0 1 -1 1h-4a1 1 0 0 1 -1 -1z" />
                    <path d="M14 7l6 0" />
                    <path d="M17 4l0 6" />
                  </svg>
                </a>
                <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-end dropdown-menu-card">
                  <div class="card">
                    <div class="card-header">
                      <div class="card-title">My Apps</div>
                      <div class="card-actions btn-actions">
                        <a href="#" class="btn-action">
                          <!-- Download SVG icon from http://tabler.io/icons/icon/settings -->
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24"
                            height="24"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            class="icon icon-1"
                          >
                            <path
                              d="M10.325 4.317c.426 -1.756 2.924 -1.756 3.35 0a1.724 1.724 0 0 0 2.573 1.066c1.543 -.94 3.31 .826 2.37 2.37a1.724 1.724 0 0 0 1.065 2.572c1.756 .426 1.756 2.924 0 3.35a1.724 1.724 0 0 0 -1.066 2.573c.94 1.543 -.826 3.31 -2.37 2.37a1.724 1.724 0 0 0 -2.572 1.065c-.426 1.756 -2.924 1.756 -3.35 0a1.724 1.724 0 0 0 -2.573 -1.066c-1.543 .94 -3.31 -.826 -2.37 -2.37a1.724 1.724 0 0 0 -1.065 -2.572c-1.756 -.426 -1.756 -2.924 0 -3.35a1.724 1.724 0 0 0 1.066 -2.573c-.94 -1.543 .826 -3.31 2.37 -2.37c1 .608 2.296 .07 2.572 -1.065z"
                            />
                            <path d="M9 12a3 3 0 1 0 6 0a3 3 0 0 0 -6 0" />
                          </svg>
                        </a>
                      </div>
                    </div>
                    <div class="card-body scroll-y p-2" style="max-height: 50vh">
                      <div class="row g-0">
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/amazon.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Amazon</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/android.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Android</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/app-store.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Apple App Store</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/apple-podcast.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Apple Podcast</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/apple.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Apple</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/behance.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Behance</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/discord.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Discord</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/dribbble.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Dribbble</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/dropbox.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Dropbox</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/ever-green.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Ever Green</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/facebook.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Facebook</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/figma.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Figma</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/github.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">GitHub</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/gitlab.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">GitLab</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google-ads.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google Ads</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google-adsense.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google AdSense</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google-analytics.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google Analytics</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google-cloud.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google Cloud</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google-drive.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google Drive</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google-fit.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google Fit</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google-home.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google Home</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google-maps.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google Maps</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google-meet.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google Meet</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google-photos.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google Photos</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google-play.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google Play</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google-shopping.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google Shopping</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google-teams.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google Teams</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/google.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Google</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/instagram.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Instagram</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/klarna.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Klarna</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/linkedin.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">LinkedIn</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/mailchimp.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Mailchimp</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/medium.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Medium</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/messenger.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Messenger</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/meta.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Meta</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/monday.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Monday</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/netflix.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Netflix</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/notion.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Notion</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/office-365.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Office 365</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/opera.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Opera</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/paypal.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">PayPal</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/petreon.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Patreon</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/pinterest.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Pinterest</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/play-store.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Play Store</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/quora.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Quora</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/reddit.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Reddit</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/shopify.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Shopify</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/skype.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Skype</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/slack.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Slack</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/snapchat.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Snapchat</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/soundcloud.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">SoundCloud</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/spotify.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Spotify</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/stripe.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Stripe</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/telegram.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Telegram</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/tiktok.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">TikTok</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/tinder.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Tinder</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/trello.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Trello</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/truth.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Truth</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/tumblr.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Tumblr</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/twitch.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Twitch</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/twitter.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Twitter</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/vimeo.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Vimeo</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/vk.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">VK</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/watppad.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Wattpad</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/webflow.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Webflow</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/whatsapp.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">WhatsApp</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/wordpress.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">WordPress</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/xing.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Xing</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/yelp.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Yelp</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/youtube.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">YouTube</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/zapier.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Zapier</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/zendesk.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Zendesk</span>
                          </a>
                        </div>
                        <div class="col-4">
                          <a href="#" class="d-flex flex-column flex-center text-center text-secondary py-2 px-2 link-hoverable">
                            <img src="../static/brands/zoom.svg" class="w-6 h-6 mx-auto mb-2" width="24" height="24" alt="" />
                            <span class="h5">Zoom</span>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="nav-item dropdown">
              <a href="#" class="nav-link d-flex lh-1 p-0 px-2" data-bs-toggle="dropdown" aria-label="Open user menu">
                <span class="avatar avatar-sm" style="background-image: url(../static/avatars/000m.jpg)"> </span>
                <div class="d-none d-xl-block ps-2">
                  <div>Paweł Kuna</div>
                  <div class="mt-1 small text-secondary">UI Designer</div>
                </div>
              </a>
              <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <a href="#" class="dropdown-item">Status</a>
                <a href="../profile.html" class="dropdown-item">Profile</a>
                <a href="#" class="dropdown-item">Feedback</a>
                <div class="dropdown-divider"></div>
                <a href="../settings.html" class="dropdown-item">Settings</a>
                <a href="../sign-in.html" class="dropdown-item">Logout</a>
              </div>
            </div>
          </div>
        </div>
      </header>
      <header class="navbar-expand-md">
        <div class="collapse navbar-collapse" id="navbar-menu">
          <div class="navbar">
            <div class="container-xl">
              <div class="row flex-column flex-md-row flex-fill align-items-center">
                <div class="col">
                  <!-- BEGIN NAVBAR MENU -->
                  <ul class="navbar-nav">
                    <li class="nav-item active">
                      <a class="nav-link" href="../">
                        <span class="nav-link-icon d-md-none d-lg-inline-block"
                          ><!-- Download SVG icon from http://tabler.io/icons/icon/home -->
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24"
                            height="24"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            class="icon icon-1"
                          >
                            <path d="M5 12l-2 0l9 -9l9 9l-2 0" />
                            <path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" />
                            <path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" /></svg
                        ></span>
                        <span class="nav-link-title"> Home </span>
                      </a>
                    </li>
                    <li class="nav-item dropdown">
                      <a
                        class="nav-link dropdown-toggle"
                        href="#navbar-base"
                        data-bs-toggle="dropdown"
                        data-bs-auto-close="outside"
                        role="button"
                        aria-expanded="false"
                      >
                        <span class="nav-link-icon d-md-none d-lg-inline-block"
                          ><!-- Download SVG icon from http://tabler.io/icons/icon/package -->
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24"
                            height="24"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            class="icon icon-1"
                          >
                            <path d="M12 3l8 4.5l0 9l-8 4.5l-8 -4.5l0 -9l8 -4.5" />
                            <path d="M12 12l8 -4.5" />
                            <path d="M12 12l0 9" />
                            <path d="M12 12l-8 -4.5" />
                            <path d="M16 5.25l-8 4.5" /></svg
                        ></span>
                        <span class="nav-link-title"> Interface </span>
                      </a>
                      <div class="dropdown-menu">
                        <div class="dropdown-menu-columns">
                          <div class="dropdown-menu-column">
                            <a class="dropdown-item" href="../accordion.html">
                              Accordion
                              <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">New</span>
                            </a>
                            <a class="dropdown-item" href="../alerts.html"> Alerts </a>
                            <div class="dropend">
                              <a
                                class="dropdown-item dropdown-toggle"
                                href="#sidebar-authentication"
                                data-bs-toggle="dropdown"
                                data-bs-auto-close="outside"
                                role="button"
                                aria-expanded="false"
                              >
                                Authentication
                              </a>
                              <div class="dropdown-menu">
                                <a href="../sign-in.html" class="dropdown-item"> Sign in </a>
                                <a href="../sign-in-link.html" class="dropdown-item"> Sign in link </a>
                                <a href="../sign-in-illustration.html" class="dropdown-item"> Sign in with illustration </a>
                                <a href="../sign-in-cover.html" class="dropdown-item"> Sign in with cover </a>
                                <a href="../sign-up.html" class="dropdown-item"> Sign up </a>
                                <a href="../forgot-password.html" class="dropdown-item"> Forgot password </a>
                                <a href="../terms-of-service.html" class="dropdown-item"> Terms of service </a>
                                <a href="../auth-lock.html" class="dropdown-item"> Lock screen </a>
                                <a href="../2-step-verification.html" class="dropdown-item"> 2 step verification </a>
                                <a href="../2-step-verification-code.html" class="dropdown-item"> 2 step verification code </a>
                              </div>
                            </div>
                            <a class="dropdown-item" href="../avatars.html">
                              Avatars
                              <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">New</span>
                            </a>
                            <a class="dropdown-item" href="../badges.html"> Badges </a>
                            <a class="dropdown-item" href="../blank.html"> Blank page </a>
                            <a class="dropdown-item" href="../buttons.html"> Buttons </a>
                            <div class="dropend">
                              <a
                                class="dropdown-item dropdown-toggle"
                                href="#sidebar-cards"
                                data-bs-toggle="dropdown"
                                data-bs-auto-close="outside"
                                role="button"
                                aria-expanded="false"
                              >
                                Cards
                              </a>
                              <div class="dropdown-menu">
                                <a href="../cards.html" class="dropdown-item"> Sample cards </a>
                                <a href="../card-actions.html" class="dropdown-item">
                                  Card actions
                                  <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">New</span>
                                </a>
                                <a href="../cards-masonry.html" class="dropdown-item"> Cards Masonry </a>
                              </div>
                            </div>
                            <a class="dropdown-item" href="../carousel.html"> Carousel </a>
                            <a class="dropdown-item" href="../colors.html"> Colors </a>
                            <a class="dropdown-item" href="../datagrid.html"> Data grid </a>
                            <a class="dropdown-item" href="../dropdowns.html"> Dropdowns </a>
                            <div class="dropend">
                              <a
                                class="dropdown-item dropdown-toggle"
                                href="#sidebar-error"
                                data-bs-toggle="dropdown"
                                data-bs-auto-close="outside"
                                role="button"
                                aria-expanded="false"
                              >
                                Error pages
                              </a>
                              <div class="dropdown-menu">
                                <a href="../error-404.html" class="dropdown-item"> 404 page </a>
                                <a href="../error-500.html" class="dropdown-item"> 500 page </a>
                                <a href="../error-maintenance.html" class="dropdown-item"> Maintenance page </a>
                              </div>
                            </div>
                            <a class="dropdown-item" href="../lists.html"> Lists </a>
                            <a class="dropdown-item" href="../modals.html"> Modals </a>
                          </div>
                          <div class="dropdown-menu-column">
                            <a class="dropdown-item" href="../markdown.html"> Markdown </a>
                            <a class="dropdown-item" href="../navigation.html"> Navigation </a>
                            <a class="dropdown-item" href="../offcanvas.html"> Offcanvas </a>
                            <a class="dropdown-item" href="../pagination.html"> Pagination </a>
                            <a class="dropdown-item" href="../placeholder.html"> Placeholder </a>
                            <a class="dropdown-item" href="../segmented-control.html">
                              Segmented control
                              <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">New</span>
                            </a>
                            <a class="dropdown-item" href="../scroll-spy.html">
                              Scroll spy
                              <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">New</span>
                            </a>
                            <a class="dropdown-item" href="../social-icons.html"> Social icons </a>
                            <a class="dropdown-item" href="../stars-rating.html"> Stars rating </a>
                            <a class="dropdown-item" href="../steps.html"> Steps </a>
                            <a class="dropdown-item" href="../tables.html"> Tables </a>
                            <a class="dropdown-item" href="../tabs.html"> Tabs </a>
                            <a class="dropdown-item" href="../tags.html"> Tags </a>
                            <a class="dropdown-item" href="../toasts.html"> Toasts </a>
                            <a class="dropdown-item" href="../typography.html"> Typography </a>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li class="nav-item dropdown">
                      <a
                        class="nav-link dropdown-toggle"
                        href="#navbar-form"
                        data-bs-toggle="dropdown"
                        data-bs-auto-close="outside"
                        role="button"
                        aria-expanded="false"
                      >
                        <span class="nav-link-icon d-md-none d-lg-inline-block"
                          ><!-- Download SVG icon from http://tabler.io/icons/icon/checkbox -->
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24"
                            height="24"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            class="icon icon-1"
                          >
                            <path d="M9 11l3 3l8 -8" />
                            <path d="M20 12v6a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h9" /></svg
                        ></span>
                        <span class="nav-link-title"> Forms </span>
                      </a>
                      <div class="dropdown-menu">
                        <a class="dropdown-item" href="../form-elements.html"> Form elements </a>
                        <a class="dropdown-item" href="../form-layout.html">
                          Form layouts
                          <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">New</span>
                        </a>
                      </div>
                    </li>






                    
                    <!-- vung thay doi 001 -->

                    <li class="nav-item dropdown">
                      <a
                        class="nav-link dropdown-toggle"
                        href="#navbar-addons"
                        data-bs-toggle="dropdown"
                        data-bs-auto-close="outside"
                        role="button"
                        aria-expanded="false"
                      >
                        <span class="nav-link-icon d-md-none d-lg-inline-block"
                          ><!-- Download SVG icon from http://tabler.io/icons/icon/gift -->
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-brand-dropbox"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M7.5 10.625l-4.5 -2.813l4.5 -2.812l4.5 2.813m-4.5 2.812l4.5 -2.813m-4.5 2.813l-4.5 2.823l4.5 2.802m0 -5.625l4.5 2.823m0 -5.636l4.5 2.791l4.5 -2.812l-4.5 -2.791l-4.5 2.813zm-4.5 8.438l4.5 -2.802m-4.5 2.802v1.123l4.5 2.627l4.5 -2.627v-1.123m-4.5 -2.802l4.5 -2.823l4.5 2.823l-4.5 2.802m-4.5 -2.802l4.5 2.802" /></svg>
                        </span>
                        <span class="nav-link-title"> Product </span>
                      </a>
                      <div class="dropdown-menu">
                        <a class="dropdown-item" href="./index-manage.php"> Product Management  </a>
                        <a class="dropdown-item" href="./index-orders.php"> Orders </a>
                        <a class="dropdown-item" href="./index-cart.php"> Cart </a>
                        <a class="dropdown-item" href="./index-product.php"> Add New Product </a>
                      </div>
                    </li>
                    <!-- vung thay doi /001 -->

                    
                    <!-- vung thay doi 002 -->

                    <li class="nav-item dropdown">
                        <a
                            class="nav-link dropdown-toggle"
                            href="#navbar-addons"
                            data-bs-toggle="dropdown"
                            data-bs-auto-close="outside"
                            role="button"
                            aria-expanded="false"
                        >
                            <span class="nav-link-icon d-md-none d-lg-inline-block"
                                ><!-- Download SVG icon from http://tabler.io/icons/icon/gift -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-settings"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M10.325 4.317c.426 -1.756 2.924 -1.756 3.35 0a1.724 1.724 0 0 0 2.573 1.066c1.543 -.94 3.31 .826 2.37 2.37a1.724 1.724 0 0 0 1.065 2.572c1.756 .426 1.756 2.924 0 3.35a1.724 1.724 0 0 0 -1.066 2.573c.94 1.543 -.826 3.31 -2.37 2.37a1.724 1.724 0 0 0 -2.572 1.065c-.426 1.756 -2.924 1.756 -3.35 0a1.724 1.724 0 0 0 -2.573 -1.066c-1.543 .94 -3.31 -.826 -2.37 -2.37a1.724 1.724 0 0 0 -1.065 -2.572c-1.756 -.426 -1.756 -2.924 0 -3.35a1.724 1.724 0 0 0 1.066 -2.573c-.94 -1.543 .826 -3.31 2.37 -2.37c1 .608 2.296 .07 2.572 -1.065z" /><path d="M9 12a3 3 0 1 0 6 0a3 3 0 0 0 -6 0" /></svg>
                            </span>
                            <span class="nav-link-title"> Config&FAQ </span>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="../task2/config.html"> Config  </a>
                            <a class="dropdown-item" href="../task2/FAQ.html"> FAQ </a>
                        </div>
                    </li>
                    <!-- vung thay doi /002 -->

                    <!-- vung thay doi 003 -->
                    <li class="nav-item dropdown">
                        <a
                            class="nav-link dropdown-toggle"
                            href="#navbar-addons"
                            data-bs-toggle="dropdown"
                            data-bs-auto-close="outside"
                            role="button"
                            aria-expanded="false"
                        >
                            <span class="nav-link-icon d-md-none d-lg-inline-block"
                                ><!-- Download SVG icon from http://tabler.io/icons/icon/gift -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-article"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M3 4m0 2a2 2 0 0 1 2 -2h14a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2z" /><path d="M7 8h10" /><path d="M7 12h10" /><path d="M7 16h10" /></svg>
                            </span>
                            <span class="nav-link-title"> News </span>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="../admin/news/index.html">
                                Quản lý bài viết
                                <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">New</span>
                            </a>
                            <a class="dropdown-item" href="../admin/comments/index.html">
                                Quản lý bình luận
                                <span class="badge badge-sm bg-green-lt text-uppercase ms-auto">New</span>
                            </a>
                        </div>
                    </li>
                    <!-- vung thay doi 003 -->

                  </ul>
                  <!-- END NAVBAR MENU -->
                </div>
                <div class="col col-md-auto">
                  <ul class="navbar-nav">
                    <li class="nav-item">
                      <a class="nav-link" href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSettings">
                        <span class="badge badge-sm bg-red text-red-fg">New</span>
                        <span class="nav-link-icon d-md-none d-lg-inline-block">
                          <!-- Download SVG icon from http://tabler.io/icons/icon/settings -->
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24"
                            height="24"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            class="icon icon-1"
                          >
                            <path
                              d="M10.325 4.317c.426 -1.756 2.924 -1.756 3.35 0a1.724 1.724 0 0 0 2.573 1.066c1.543 -.94 3.31 .826 2.37 2.37a1.724 1.724 0 0 0 1.065 2.572c1.756 .426 1.756 2.924 0 3.35a1.724 1.724 0 0 0 -1.066 2.573c.94 1.543 -.826 3.31 -2.37 2.37a1.724 1.724 0 0 0 -2.572 1.065c-.426 1.756 -2.924 1.756 -3.35 0a1.724 1.724 0 0 0 -2.573 -1.066c-1.543 .94 -3.31 -.826 -2.37 -2.37a1.724 1.724 0 0 0 -1.065 -2.572c-1.756 -.426 -1.756 -2.924 0 -3.35a1.724 1.724 0 0 0 1.066 -2.573c-.94 -1.543 .826 -3.31 2.37 -2.37c1 .608 2.296 .07 2.572 -1.065z"
                            />
                            <path d="M9 12a3 3 0 1 0 6 0a3 3 0 0 0 -6 0" />
                          </svg>
                        </span>
                        <span class="nav-link-title"> Theme Settings </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </header>
















        <!-- vung thuc hien -->

        <div class="page-body">
          <div class="container-xl py-4">
            <div class="card">
              <div class="card-body">
                <h3 id="formTitle">Product</h3>
                <form id="productForm" enctype="multipart/form-data">
                  <input type="hidden" name="id" id="pid">
                  <div class="row">
                    <div class="col-md-8">
                      <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input class="form-control" id="name" name="name" required>
                      </div>

                      <div class="mb-3">
                        <label class="form-label"> Category </label>
                          <select class="form-select" id="category" name="category">
                            <option></option>
                            <option>Laptop</option>
                            <option>Điện thoại</option>
                            <option>Tai nghe</option>
                            <option>Đồng hồ</option>
                            <option>Tablet</option>
                            <option>Camera</option>
                          </select>
                      </div>
                      
                      <div class="row">
                        <div class="col-md-4 mb-3">
                          <label class="form-label">Price</label>
                          <input type="number" step="0.01" class="form-control" id="price" name="price" required>
                        </div>
                        <div class="col-md-4 mb-3">
                          <label class="form-label">Old Price</label>
                          <input type="number" step="0.01" class="form-control" id="old_price" name="old_price">
                        </div>
                        <div class="col-md-4 mb-3">
                          <label class="form-label">Amount</label>
                          <input type="number" class="form-control" id="amount" name="amount" required>
                        </div>
                      </div>
                      <div class="mb-3">
                        <label class="form-label">Chip</label>
                        <input class="form-control" id="chip" name="chip">
                      </div>
                      <div class="mb-3">
                        <label class="form-label">RAM</label>
                        <input class="form-control" id="ram" name="ram">
                      </div>
                      <div class="mb-3">
                        <label class="form-label">Screen</label>
                        <input class="form-control" id="screen" name="screen">
                      </div>
                      <div class="mb-3">
                        <label class="form-label">Battery</label>
                        <input class="form-control" id="battery" name="battery">
                      </div>
                      <div class="mb-3">
                        <label class="form-label">Guarantee</label>
                        <input class="form-control" id="guarantee" name="guarantee" value="12 Tháng">
                      </div>
                      <div class="mb-3">
                        <label class="form-label">Outstanding (HTML allowed)</label>
                        <textarea class="form-control" id="outstanding" name="outstanding" rows="3"></textarea>
                      </div>
                      <div class="row">
                        <div class="col-md-4 mb-3">
                          <label class="form-label">Rating</label>
                          <input type="number" step="0.1" max="5" min="0" class="form-control" id="rating" name="rating" value="5">
                        </div>
                        <div class="col-md-4 mb-3">
                          <label class="form-label">Is Featured</label>
                          <select id="is_featured" name="is_featured" class="form-control">
                            <option value="0">No</option>
                            <option value="1">Yes</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="mb-3">
                        <label class="form-label">Primary Image</label>
                        <input type="file" class="form-control" id="imageFile" accept="image/*">
                        <input type="hidden" id="image" name="image">
                        <div class="mt-2"><img id="imagePreview" src="" style="max-height:120px; display:none"></div>
                      </div>
                      <div class="mb-3">
                        <label class="form-label">Image 1</label>
                        <input type="file" class="form-control" id="image1File" accept="image/*">
                        <input type="hidden" id="image1" name="image1">
                        <div class="mt-2"><img id="image1Preview" src="" style="max-height:120px; display:none"></div>
                      </div>
                      <div class="mb-3">
                        <label class="form-label">Image 2</label>
                        <input type="file" class="form-control" id="image2File" accept="image/*">
                        <input type="hidden" id="image2" name="image2">
                        <div class="mt-2"><img id="image2Preview" src="" style="max-height:120px; display:none"></div>
                      </div>
                      <div class="mb-3">
                        <label class="form-label">Image 3</label>
                        <input type="file" class="form-control" id="image3File" accept="image/*">
                        <input type="hidden" id="image3" name="image3">
                        <div class="mt-2"><img id="image3Preview" src="" style="max-height:120px; display:none"></div>
                      </div>
                    </div>
                  </div>
                  <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <a href="./index-manage.php" class="btn btn-link">Back</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>

        <!-- vung thuc hien/  -->

        <!--  BEGIN FOOTER  -->
        <footer class="footer footer-transparent d-print-none">
          <div class="container-xl">
            <div class="row text-center align-items-center flex-row-reverse">
              <div class="col-lg-auto ms-lg-auto">
                <ul class="list-inline list-inline-dots mb-0">
                  <li class="list-inline-item"><a href="https://docs.tabler.io" target="_blank" class="link-secondary" rel="noopener">Documentation</a></li>
                  <li class="list-inline-item"><a href="../license.html" class="link-secondary">License</a></li>
                  <li class="list-inline-item">
                    <a href="https://github.com/tabler/tabler" target="_blank" class="link-secondary" rel="noopener">Source code</a>
                  </li>
                  <li class="list-inline-item">
                    <a href="https://github.com/sponsors/codecalm" target="_blank" class="link-secondary" rel="noopener">
                      <!-- Download SVG icon from http://tabler.io/icons/icon/heart -->
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="icon text-pink icon-inline icon-4"
                      >
                        <path d="M19.5 12.572l-7.5 7.428l-7.5 -7.428a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572" />
                      </svg>
                      Sponsor
                    </a>
                  </li>
                </ul>
              </div>
              <div class="col-12 col-lg-auto mt-3 mt-lg-0">
                <ul class="list-inline list-inline-dots mb-0">
                  <li class="list-inline-item">
                    Copyright &copy; 2025
                    <a href="../" class="link-secondary">Tabler</a>. All rights reserved.
                  </li>
                  <li class="list-inline-item">
                    <a href="../changelog.html" class="link-secondary" rel="noopener"> v1.4.0 </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </footer>
        <!--  END FOOTER  -->
      </div>
    </div>
    <!-- BEGIN PAGE MODALS -->
    <div class="modal modal-blur fade" id="modal-report" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">New report</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label class="form-label">Name</label>
              <input type="text" class="form-control" name="example-text-input" placeholder="Your report name" />
            </div>
            <label class="form-label">Report type</label>
            <div class="form-selectgroup-boxes row mb-3">
              <div class="col-lg-6">
                <label class="form-selectgroup-item">
                  <input type="radio" name="report-type" value="1" class="form-selectgroup-input" checked />
                  <span class="form-selectgroup-label d-flex align-items-center p-3">
                    <span class="me-3">
                      <span class="form-selectgroup-check"></span>
                    </span>
                    <span class="form-selectgroup-label-content">
                      <span class="form-selectgroup-title strong mb-1">Simple</span>
                      <span class="d-block text-secondary">Provide only basic data needed for the report</span>
                    </span>
                  </span>
                </label>
              </div>
              <div class="col-lg-6">
                <label class="form-selectgroup-item">
                  <input type="radio" name="report-type" value="1" class="form-selectgroup-input" />
                  <span class="form-selectgroup-label d-flex align-items-center p-3">
                    <span class="me-3">
                      <span class="form-selectgroup-check"></span>
                    </span>
                    <span class="form-selectgroup-label-content">
                      <span class="form-selectgroup-title strong mb-1">Advanced</span>
                      <span class="d-block text-secondary">Insert charts and additional advanced analyses to be inserted in the report</span>
                    </span>
                  </span>
                </label>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-8">
                <div class="mb-3">
                  <label class="form-label">Report url</label>
                  <div class="input-group input-group-flat">
                    <span class="input-group-text"> https://tabler.io/reports/ </span>
                    <input type="text" class="form-control ps-0" value="report-01" autocomplete="off" />
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">Visibility</label>
                  <select class="form-select">
                    <option value="1" selected>Private</option>
                    <option value="2">Public</option>
                    <option value="3">Hidden</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-lg-6">
                <div class="mb-3">
                  <label class="form-label">Client name</label>
                  <input type="text" class="form-control" />
                </div>
              </div>
              <div class="col-lg-6">
                <div class="mb-3">
                  <label class="form-label">Reporting period</label>
                  <input type="date" class="form-control" />
                </div>
              </div>
              <div class="col-lg-12">
                <div>
                  <label class="form-label">Additional information</label>
                  <textarea class="form-control" rows="3"></textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <a href="#" class="btn btn-link link-secondary btn-3" data-bs-dismiss="modal"> Cancel </a>
            <a href="#" class="btn btn-primary btn-5 ms-auto" data-bs-dismiss="modal">
              <!-- Download SVG icon from http://tabler.io/icons/icon/plus -->
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="icon icon-2"
              >
                <path d="M12 5l0 14" />
                <path d="M5 12l14 0" />
              </svg>
              Create new report
            </a>
          </div>
        </div>
      </div>
    </div>
    <!-- END PAGE MODALS -->
    <div class="settings">
      <a
        href="#"
        class="btn btn-floating btn-icon btn-primary"
        data-bs-toggle="offcanvas"
        data-bs-target="#offcanvasSettings"
        aria-controls="offcanvasSettings"
        aria-label="Theme Settings"
      >
        <!-- Download SVG icon from http://tabler.io/icons/icon/brush -->
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24"
          height="24"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
          class="icon icon-1"
        >
          <path d="M3 21v-4a4 4 0 1 1 4 4h-4" />
          <path d="M21 3a16 16 0 0 0 -12.8 10.2" />
          <path d="M21 3a16 16 0 0 1 -10.2 12.8" />
          <path d="M10.6 9a9 9 0 0 1 4.4 4.4" />
        </svg>
      </a>
      <form class="offcanvas offcanvas-start offcanvas-narrow" tabindex="-1" id="offcanvasSettings">
        <div class="offcanvas-header">
          <h2 class="offcanvas-title">Theme Settings</h2>
          <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body d-flex flex-column">
          <div>
            <div class="mb-4">
              <label class="form-label">Color mode</label>
              <p class="form-hint">Choose the color mode for your app.</p>
              <label class="form-check">
                <div class="form-selectgroup-item">
                  <input type="radio" name="theme" value="light" class="form-check-input" checked />
                  <div class="form-check-label">Light</div>
                </div>
              </label>
              <label class="form-check">
                <div class="form-selectgroup-item">
                  <input type="radio" name="theme" value="dark" class="form-check-input" />
                  <div class="form-check-label">Dark</div>
                </div>
              </label>
            </div>
            <div class="mb-4">
              <label class="form-label">Color scheme</label>
              <p class="form-hint">The perfect color mode for your app.</p>
              <div class="row g-2">
                <div class="col-auto">
                  <label class="form-colorinput">
                    <input name="theme-primary" type="radio" value="blue" class="form-colorinput-input" />
                    <span class="form-colorinput-color bg-blue"></span>
                  </label>
                </div>
                <div class="col-auto">
                  <label class="form-colorinput">
                    <input name="theme-primary" type="radio" value="azure" class="form-colorinput-input" />
                    <span class="form-colorinput-color bg-azure"></span>
                  </label>
                </div>
                <div class="col-auto">
                  <label class="form-colorinput">
                    <input name="theme-primary" type="radio" value="indigo" class="form-colorinput-input" />
                    <span class="form-colorinput-color bg-indigo"></span>
                  </label>
                </div>
                <div class="col-auto">
                  <label class="form-colorinput">
                    <input name="theme-primary" type="radio" value="purple" class="form-colorinput-input" />
                    <span class="form-colorinput-color bg-purple"></span>
                  </label>
                </div>
                <div class="col-auto">
                  <label class="form-colorinput">
                    <input name="theme-primary" type="radio" value="pink" class="form-colorinput-input" />
                    <span class="form-colorinput-color bg-pink"></span>
                  </label>
                </div>
                <div class="col-auto">
                  <label class="form-colorinput">
                    <input name="theme-primary" type="radio" value="red" class="form-colorinput-input" />
                    <span class="form-colorinput-color bg-red"></span>
                  </label>
                </div>
                <div class="col-auto">
                  <label class="form-colorinput">
                    <input name="theme-primary" type="radio" value="orange" class="form-colorinput-input" />
                    <span class="form-colorinput-color bg-orange"></span>
                  </label>
                </div>
                <div class="col-auto">
                  <label class="form-colorinput">
                    <input name="theme-primary" type="radio" value="yellow" class="form-colorinput-input" />
                    <span class="form-colorinput-color bg-yellow"></span>
                  </label>
                </div>
                <div class="col-auto">
                  <label class="form-colorinput">
                    <input name="theme-primary" type="radio" value="lime" class="form-colorinput-input" />
                    <span class="form-colorinput-color bg-lime"></span>
                  </label>
                </div>
                <div class="col-auto">
                  <label class="form-colorinput">
                    <input name="theme-primary" type="radio" value="green" class="form-colorinput-input" />
                    <span class="form-colorinput-color bg-green"></span>
                  </label>
                </div>
                <div class="col-auto">
                  <label class="form-colorinput">
                    <input name="theme-primary" type="radio" value="teal" class="form-colorinput-input" />
                    <span class="form-colorinput-color bg-teal"></span>
                  </label>
                </div>
                <div class="col-auto">
                  <label class="form-colorinput">
                    <input name="theme-primary" type="radio" value="cyan" class="form-colorinput-input" />
                    <span class="form-colorinput-color bg-cyan"></span>
                  </label>
                </div>
              </div>
            </div>
            <div class="mb-4">
              <label class="form-label">Font family</label>
              <p class="form-hint">Choose the font family that fits your app.</p>
              <div>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-font" value="sans-serif" class="form-check-input" checked />
                    <div class="form-check-label">Sans-serif</div>
                  </div>
                </label>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-font" value="serif" class="form-check-input" />
                    <div class="form-check-label">Serif</div>
                  </div>
                </label>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-font" value="monospace" class="form-check-input" />
                    <div class="form-check-label">Monospace</div>
                  </div>
                </label>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-font" value="comic" class="form-check-input" />
                    <div class="form-check-label">Comic</div>
                  </div>
                </label>
              </div>
            </div>
            <div class="mb-4">
              <label class="form-label">Theme base</label>
              <p class="form-hint">Choose the gray shade for your app.</p>
              <div>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-base" value="slate" class="form-check-input" />
                    <div class="form-check-label">Slate</div>
                  </div>
                </label>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-base" value="gray" class="form-check-input" checked />
                    <div class="form-check-label">Gray</div>
                  </div>
                </label>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-base" value="zinc" class="form-check-input" />
                    <div class="form-check-label">Zinc</div>
                  </div>
                </label>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-base" value="neutral" class="form-check-input" />
                    <div class="form-check-label">Neutral</div>
                  </div>
                </label>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-base" value="stone" class="form-check-input" />
                    <div class="form-check-label">Stone</div>
                  </div>
                </label>
              </div>
            </div>
            <div class="mb-4">
              <label class="form-label">Corner Radius</label>
              <p class="form-hint">Choose the border radius factor for your app.</p>
              <div>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-radius" value="0" class="form-check-input" />
                    <div class="form-check-label">0</div>
                  </div>
                </label>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-radius" value="0.5" class="form-check-input" />
                    <div class="form-check-label">0.5</div>
                  </div>
                </label>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-radius" value="1" class="form-check-input" checked />
                    <div class="form-check-label">1</div>
                  </div>
                </label>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-radius" value="1.5" class="form-check-input" />
                    <div class="form-check-label">1.5</div>
                  </div>
                </label>
                <label class="form-check">
                  <div class="form-selectgroup-item">
                    <input type="radio" name="theme-radius" value="2" class="form-check-input" />
                    <div class="form-check-label">2</div>
                  </div>
                </label>
              </div>
            </div>
          </div>
          <div class="mt-auto space-y">
            <button type="button" class="btn w-100" id="reset-changes">
              <!-- Download SVG icon from http://tabler.io/icons/icon/rotate -->
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="icon icon-1"
              >
                <path d="M19.95 11a8 8 0 1 0 -.5 4m.5 5v-5h-5" />
              </svg>
              Reset changes
            </button>
            <a href="#" class="btn btn-primary w-100" data-bs-dismiss="offcanvas"> Save </a>
          </div>
        </div>
      </form>
    </div>
    <!-- BEGIN PAGE LIBRARIES -->
    <script src="../dist/libs/apexcharts/dist/apexcharts.min.js?1760059270" defer></script>
    <script src="../dist/libs/jsvectormap/dist/jsvectormap.min.js?1760059270" defer></script>
    <script src="../dist/libs/jsvectormap/dist/maps/world.js?1760059270" defer></script>
    <script src="../dist/libs/jsvectormap/dist/maps/world-merc.js?1760059270" defer></script>
    <!-- END PAGE LIBRARIES -->
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../dist/js/tabler.min.js?1760059270" defer></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <!-- BEGIN DEMO SCRIPTS -->
    <script src="../preview/js/demo.min.js?1760059270" defer></script>
    <!-- END DEMO SCRIPTS -->
    <!-- BEGIN PAGE SCRIPTS -->
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("chart-visitors"), {
            chart: {
              type: "line",
              fontFamily: "inherit",
              height: 96,
              sparkline: {
                enabled: true,
              },
              animations: {
                enabled: false,
              },
            },
            stroke: {
              width: [2, 1],
              dashArray: [0, 3],
              lineCap: "round",
              curve: "smooth",
            },
            series: [
              {
                name: "Visitors",
                data: [
                  7687, 7543, 7545, 7543, 7635, 8140, 7810, 8315, 8379, 8441, 8485, 8227, 8906, 8561, 8333, 8551, 9305, 9647, 9359, 9840, 9805, 8612, 8970,
                  8097, 8070, 9829, 10545, 10754, 10270, 9282,
                ],
              },
              {
                name: "Visitors last month",
                data: [
                  8630, 9389, 8427, 9669, 8736, 8261, 8037, 8922, 9758, 8592, 8976, 9459, 8125, 8528, 8027, 8256, 8670, 9384, 9813, 8425, 8162, 8024, 8897,
                  9284, 8972, 8776, 8121, 9476, 8281, 9065,
                ],
              },
            ],
            tooltip: {
              theme: "dark",
            },
            grid: {
              strokeDashArray: 4,
            },
            xaxis: {
              labels: {
                padding: 0,
              },
              tooltip: {
                enabled: false,
              },
              type: "datetime",
            },
            yaxis: {
              labels: {
                padding: 4,
              },
            },
            labels: [
              "2020-06-20",
              "2020-06-21",
              "2020-06-22",
              "2020-06-23",
              "2020-06-24",
              "2020-06-25",
              "2020-06-26",
              "2020-06-27",
              "2020-06-28",
              "2020-06-29",
              "2020-06-30",
              "2020-07-01",
              "2020-07-02",
              "2020-07-03",
              "2020-07-04",
              "2020-07-05",
              "2020-07-06",
              "2020-07-07",
              "2020-07-08",
              "2020-07-09",
              "2020-07-10",
              "2020-07-11",
              "2020-07-12",
              "2020-07-13",
              "2020-07-14",
              "2020-07-15",
              "2020-07-16",
              "2020-07-17",
              "2020-07-18",
              "2020-07-19",
            ],
            colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 100%)", "color-mix(in srgb, transparent, var(--tblr-gray-400) 100%)"],
            legend: {
              show: false,
            },
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("chart-active-users-3"), {
            chart: {
              type: "radialBar",
              fontFamily: "inherit",
              height: 192,
              sparkline: {
                enabled: true,
              },
              animations: {
                enabled: false,
              },
            },
            plotOptions: {
              radialBar: {
                startAngle: -120,
                endAngle: 120,
                hollow: {
                  margin: 16,
                  size: "50%",
                },
                dataLabels: {
                  show: true,
                  value: {
                    offsetY: -8,
                    fontSize: "24px",
                  },
                },
              },
            },
            series: [78],
            labels: [""],
            tooltip: {
              theme: "dark",
            },
            grid: {
              strokeDashArray: 4,
            },
            colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 100%)"],
            legend: {
              show: false,
            },
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("chart-revenue-bg"), {
            chart: {
              type: "area",
              fontFamily: "inherit",
              height: 40,
              sparkline: {
                enabled: true,
              },
              animations: {
                enabled: false,
              },
            },
            dataLabels: {
              enabled: false,
            },
            fill: {
              colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 16%)", "color-mix(in srgb, transparent, var(--tblr-primary) 16%)"],
              type: "solid",
            },
            stroke: {
              width: 2,
              lineCap: "round",
              curve: "smooth",
            },
            series: [
              {
                name: "Profits",
                data: [37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46, 39, 62, 51, 35, 41, 67],
              },
            ],
            tooltip: {
              theme: "dark",
            },
            grid: {
              strokeDashArray: 4,
            },
            xaxis: {
              labels: {
                padding: 0,
              },
              tooltip: {
                enabled: false,
              },
              axisBorder: {
                show: false,
              },
              type: "datetime",
            },
            yaxis: {
              labels: {
                padding: 4,
              },
            },
            labels: [
              "2020-06-20",
              "2020-06-21",
              "2020-06-22",
              "2020-06-23",
              "2020-06-24",
              "2020-06-25",
              "2020-06-26",
              "2020-06-27",
              "2020-06-28",
              "2020-06-29",
              "2020-06-30",
              "2020-07-01",
              "2020-07-02",
              "2020-07-03",
              "2020-07-04",
              "2020-07-05",
              "2020-07-06",
              "2020-07-07",
              "2020-07-08",
              "2020-07-09",
              "2020-07-10",
              "2020-07-11",
              "2020-07-12",
              "2020-07-13",
              "2020-07-14",
              "2020-07-15",
              "2020-07-16",
              "2020-07-17",
              "2020-07-18",
              "2020-07-19",
            ],
            colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 100%)"],
            legend: {
              show: false,
            },
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("chart-new-clients"), {
            chart: {
              type: "line",
              fontFamily: "inherit",
              height: 40,
              sparkline: {
                enabled: true,
              },
              animations: {
                enabled: false,
              },
            },
            stroke: {
              width: [2, 1],
              dashArray: [0, 3],
              lineCap: "round",
              curve: "smooth",
            },
            series: [
              {
                name: "May",
                data: [37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 4, 46, 39, 62, 51, 35, 41, 67],
              },
              {
                name: "April",
                data: [93, 54, 51, 24, 35, 35, 31, 67, 19, 43, 28, 36, 62, 61, 27, 39, 35, 41, 27, 35, 51, 46, 62, 37, 44, 53, 41, 65, 39, 37],
              },
            ],
            tooltip: {
              theme: "dark",
            },
            grid: {
              strokeDashArray: 4,
            },
            xaxis: {
              labels: {
                padding: 0,
              },
              tooltip: {
                enabled: false,
              },
              type: "datetime",
            },
            yaxis: {
              labels: {
                padding: 4,
              },
            },
            labels: [
              "2020-06-20",
              "2020-06-21",
              "2020-06-22",
              "2020-06-23",
              "2020-06-24",
              "2020-06-25",
              "2020-06-26",
              "2020-06-27",
              "2020-06-28",
              "2020-06-29",
              "2020-06-30",
              "2020-07-01",
              "2020-07-02",
              "2020-07-03",
              "2020-07-04",
              "2020-07-05",
              "2020-07-06",
              "2020-07-07",
              "2020-07-08",
              "2020-07-09",
              "2020-07-10",
              "2020-07-11",
              "2020-07-12",
              "2020-07-13",
              "2020-07-14",
              "2020-07-15",
              "2020-07-16",
              "2020-07-17",
              "2020-07-18",
              "2020-07-19",
            ],
            colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 100%)", "color-mix(in srgb, transparent, var(--tblr-gray-600) 100%)"],
            legend: {
              show: false,
            },
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("chart-active-users"), {
            chart: {
              type: "bar",
              fontFamily: "inherit",
              height: 40,
              sparkline: {
                enabled: true,
              },
              animations: {
                enabled: false,
              },
            },
            plotOptions: {
              bar: {
                columnWidth: "50%",
              },
            },
            dataLabels: {
              enabled: false,
            },
            series: [
              {
                name: "Profits",
                data: [37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46, 39, 62, 51, 35, 41, 67],
              },
            ],
            tooltip: {
              theme: "dark",
            },
            grid: {
              strokeDashArray: 4,
            },
            xaxis: {
              labels: {
                padding: 0,
              },
              tooltip: {
                enabled: false,
              },
              axisBorder: {
                show: false,
              },
              type: "datetime",
            },
            yaxis: {
              labels: {
                padding: 4,
              },
            },
            labels: [
              "2020-06-20",
              "2020-06-21",
              "2020-06-22",
              "2020-06-23",
              "2020-06-24",
              "2020-06-25",
              "2020-06-26",
              "2020-06-27",
              "2020-06-28",
              "2020-06-29",
              "2020-06-30",
              "2020-07-01",
              "2020-07-02",
              "2020-07-03",
              "2020-07-04",
              "2020-07-05",
              "2020-07-06",
              "2020-07-07",
              "2020-07-08",
              "2020-07-09",
              "2020-07-10",
              "2020-07-11",
              "2020-07-12",
              "2020-07-13",
              "2020-07-14",
              "2020-07-15",
              "2020-07-16",
              "2020-07-17",
              "2020-07-18",
              "2020-07-19",
            ],
            colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 100%)"],
            legend: {
              show: false,
            },
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("chart-mentions"), {
            chart: {
              type: "bar",
              fontFamily: "inherit",
              height: 240,
              parentHeightOffset: 0,
              toolbar: {
                show: false,
              },
              animations: {
                enabled: false,
              },
              stacked: true,
            },
            plotOptions: {
              bar: {
                columnWidth: "50%",
              },
            },
            dataLabels: {
              enabled: false,
            },
            series: [
              {
                name: "Web",
                data: [1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 2, 12, 5, 8, 22, 6, 8, 6, 4, 1, 8, 24, 29, 51, 40, 47, 23, 26, 50, 26, 41, 22, 46, 47, 81, 46, 6],
              },
              {
                name: "Social",
                data: [2, 5, 4, 3, 3, 1, 4, 7, 5, 1, 2, 5, 3, 2, 6, 7, 7, 1, 5, 5, 2, 12, 4, 6, 18, 3, 5, 2, 13, 15, 20, 47, 18, 15, 11, 10, 0],
              },
              {
                name: "Other",
                data: [2, 9, 1, 7, 8, 3, 6, 5, 5, 4, 6, 4, 1, 9, 3, 6, 7, 5, 2, 8, 4, 9, 1, 2, 6, 7, 5, 1, 8, 3, 2, 3, 4, 9, 7, 1, 6],
              },
            ],
            tooltip: {
              theme: "dark",
            },
            grid: {
              padding: {
                top: -20,
                right: 0,
                left: -4,
                bottom: -4,
              },
              strokeDashArray: 4,
              xaxis: {
                lines: {
                  show: true,
                },
              },
            },
            xaxis: {
              labels: {
                padding: 0,
              },
              tooltip: {
                enabled: false,
              },
              axisBorder: {
                show: false,
              },
              type: "datetime",
            },
            yaxis: {
              labels: {
                padding: 4,
              },
            },
            labels: [
              "2020-06-20",
              "2020-06-21",
              "2020-06-22",
              "2020-06-23",
              "2020-06-24",
              "2020-06-25",
              "2020-06-26",
              "2020-06-27",
              "2020-06-28",
              "2020-06-29",
              "2020-06-30",
              "2020-07-01",
              "2020-07-02",
              "2020-07-03",
              "2020-07-04",
              "2020-07-05",
              "2020-07-06",
              "2020-07-07",
              "2020-07-08",
              "2020-07-09",
              "2020-07-10",
              "2020-07-11",
              "2020-07-12",
              "2020-07-13",
              "2020-07-14",
              "2020-07-15",
              "2020-07-16",
              "2020-07-17",
              "2020-07-18",
              "2020-07-19",
              "2020-07-20",
              "2020-07-21",
              "2020-07-22",
              "2020-07-23",
              "2020-07-24",
              "2020-07-25",
              "2020-07-26",
            ],
            colors: [
              "color-mix(in srgb, transparent, var(--tblr-primary) 100%)",
              "color-mix(in srgb, transparent, var(--tblr-primary) 80%)",
              "color-mix(in srgb, transparent, var(--tblr-green) 80%)",
            ],
            legend: {
              show: false,
            },
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const map = new jsVectorMap({
          selector: "#map-world",
          map: "world",
          backgroundColor: "transparent",
          regionStyle: {
            initial: {
              fill: "var(--tblr-bg-surface-secondary)",
              stroke: "var(--tblr-border-color)",
              strokeWidth: 2,
            },
          },
          zoomOnScroll: false,
          zoomButtons: false,
          series: {
            regions: [
              {
                attribute: "fill",
                scale: {
                  scale1: "color-mix(in srgb, transparent, var(--tblr-primary) 10%)",
                  scale2: "color-mix(in srgb, transparent, var(--tblr-primary) 20%)",
                  scale3: "color-mix(in srgb, transparent, var(--tblr-primary) 30%)",
                  scale4: "color-mix(in srgb, transparent, var(--tblr-primary) 40%)",
                  scale5: "color-mix(in srgb, transparent, var(--tblr-primary) 50%)",
                  scale6: "color-mix(in srgb, transparent, var(--tblr-primary) 60%)",
                  scale7: "color-mix(in srgb, transparent, var(--tblr-primary) 70%)",
                  scale8: "color-mix(in srgb, transparent, var(--tblr-primary) 80%)",
                  scale9: "color-mix(in srgb, transparent, var(--tblr-primary) 90%)",
                  scale10: "color-mix(in srgb, transparent, var(--tblr-primary) 100%)",
                },
                values: {
                  AF: "scale2",
                  AL: "scale2",
                  DZ: "scale4",
                  AO: "scale3",
                  AG: "scale1",
                  AR: "scale5",
                  AM: "scale1",
                  AU: "scale7",
                  AT: "scale5",
                  AZ: "scale3",
                  BS: "scale1",
                  BH: "scale2",
                  BD: "scale4",
                  BB: "scale1",
                  BY: "scale3",
                  BE: "scale5",
                  BZ: "scale1",
                  BJ: "scale1",
                  BT: "scale1",
                  BO: "scale2",
                  BA: "scale2",
                  BW: "scale2",
                  BR: "scale8",
                  BN: "scale2",
                  BG: "scale2",
                  BF: "scale1",
                  BI: "scale1",
                  KH: "scale2",
                  CM: "scale2",
                  CA: "scale7",
                  CV: "scale1",
                  CF: "scale1",
                  TD: "scale1",
                  CL: "scale4",
                  CN: "scale9",
                  CO: "scale5",
                  KM: "scale1",
                  CD: "scale2",
                  CG: "scale2",
                  CR: "scale2",
                  CI: "scale2",
                  HR: "scale3",
                  CY: "scale2",
                  CZ: "scale4",
                  DK: "scale5",
                  DJ: "scale1",
                  DM: "scale1",
                  DO: "scale3",
                  EC: "scale3",
                  EG: "scale5",
                  SV: "scale2",
                  GQ: "scale2",
                  ER: "scale1",
                  EE: "scale2",
                  ET: "scale2",
                  FJ: "scale1",
                  FI: "scale5",
                  FR: "scale8",
                  GA: "scale2",
                  GM: "scale1",
                  GE: "scale2",
                  DE: "scale8",
                  GH: "scale2",
                  GR: "scale5",
                  GD: "scale1",
                  GT: "scale2",
                  GN: "scale1",
                  GW: "scale1",
                  GY: "scale1",
                  HT: "scale1",
                  HN: "scale2",
                  HK: "scale5",
                  HU: "scale4",
                  IS: "scale2",
                  IN: "scale7",
                  ID: "scale6",
                  IR: "scale5",
                  IQ: "scale3",
                  IE: "scale5",
                  IL: "scale5",
                  IT: "scale8",
                  JM: "scale2",
                  JP: "scale9",
                  JO: "scale2",
                  KZ: "scale4",
                  KE: "scale2",
                  KI: "scale1",
                  KR: "scale6",
                  KW: "scale4",
                  KG: "scale1",
                  LA: "scale1",
                  LV: "scale2",
                  LB: "scale2",
                  LS: "scale1",
                  LR: "scale1",
                  LY: "scale3",
                  LT: "scale2",
                  LU: "scale3",
                  MK: "scale1",
                  MG: "scale1",
                  MW: "scale1",
                  MY: "scale5",
                  MV: "scale1",
                  ML: "scale1",
                  MT: "scale1",
                  MR: "scale1",
                  MU: "scale1",
                  MX: "scale7",
                  MD: "scale1",
                  MN: "scale1",
                  ME: "scale1",
                  MA: "scale3",
                  MZ: "scale2",
                  MM: "scale2",
                  NA: "scale2",
                  NP: "scale2",
                  NL: "scale6",
                  NZ: "scale4",
                  NI: "scale1",
                  NE: "scale1",
                  NG: "scale5",
                  NO: "scale5",
                  OM: "scale3",
                  PK: "scale4",
                  PA: "scale2",
                  PG: "scale1",
                  PY: "scale2",
                  PE: "scale4",
                  PH: "scale4",
                  PL: "scale10",
                  PT: "scale5",
                  QA: "scale4",
                  RO: "scale4",
                  RU: "scale7",
                  RW: "scale1",
                  WS: "scale1",
                  ST: "scale1",
                  SA: "scale5",
                  SN: "scale2",
                  RS: "scale2",
                  SC: "scale1",
                  SL: "scale1",
                  SG: "scale5",
                  SK: "scale3",
                  SI: "scale2",
                  SB: "scale1",
                  ZA: "scale5",
                  ES: "scale7",
                  LK: "scale2",
                  KN: "scale1",
                  LC: "scale1",
                  VC: "scale1",
                  SD: "scale3",
                  SR: "scale1",
                  SZ: "scale1",
                  SE: "scale5",
                  CH: "scale6",
                  SY: "scale3",
                  TW: "scale5",
                  TJ: "scale1",
                  TZ: "scale2",
                  TH: "scale5",
                  TL: "scale1",
                  TG: "scale1",
                  TO: "scale1",
                  TT: "scale2",
                  TN: "scale2",
                  TR: "scale6",
                  TM: "scale1",
                  UG: "scale2",
                  UA: "scale4",
                  AE: "scale5",
                  GB: "scale8",
                  US: "scale10",
                  UY: "scale2",
                  UZ: "scale2",
                  VU: "scale1",
                  VE: "scale5",
                  VN: "scale4",
                  YE: "scale2",
                  ZM: "scale2",
                  ZW: "scale1",
                },
              },
            ],
          },
        });
        window.addEventListener("resize", () => {
          map.updateSize();
        });
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("sparkline-activity"), {
            chart: {
              type: "radialBar",
              fontFamily: "inherit",
              height: 40,
              width: 40,
              animations: {
                enabled: false,
              },
              sparkline: {
                enabled: true,
              },
            },
            tooltip: {
              enabled: false,
            },
            plotOptions: {
              radialBar: {
                hollow: {
                  margin: 0,
                  size: "75%",
                },
                track: {
                  margin: 0,
                },
                dataLabels: {
                  show: false,
                },
              },
            },
            colors: ["var(--tblr-primary)"],
            series: [35],
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("chart-development-activity"), {
            chart: {
              type: "area",
              fontFamily: "inherit",
              height: 192,
              sparkline: {
                enabled: true,
              },
              animations: {
                enabled: false,
              },
            },
            dataLabels: {
              enabled: false,
            },
            fill: {
              colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 16%)", "color-mix(in srgb, transparent, var(--tblr-primary) 16%)"],
              type: "solid",
            },
            stroke: {
              width: 2,
              lineCap: "round",
              curve: "smooth",
            },
            series: [
              {
                name: "Purchases",
                data: [3, 5, 4, 6, 7, 5, 6, 8, 24, 7, 12, 5, 6, 3, 8, 4, 14, 30, 17, 19, 15, 14, 25, 32, 40, 55, 60, 48, 52, 70],
              },
            ],
            tooltip: {
              theme: "dark",
            },
            grid: {
              strokeDashArray: 4,
            },
            xaxis: {
              labels: {
                padding: 0,
              },
              tooltip: {
                enabled: false,
              },
              axisBorder: {
                show: false,
              },
              type: "datetime",
            },
            yaxis: {
              labels: {
                padding: 4,
              },
            },
            labels: [
              "2020-06-20",
              "2020-06-21",
              "2020-06-22",
              "2020-06-23",
              "2020-06-24",
              "2020-06-25",
              "2020-06-26",
              "2020-06-27",
              "2020-06-28",
              "2020-06-29",
              "2020-06-30",
              "2020-07-01",
              "2020-07-02",
              "2020-07-03",
              "2020-07-04",
              "2020-07-05",
              "2020-07-06",
              "2020-07-07",
              "2020-07-08",
              "2020-07-09",
              "2020-07-10",
              "2020-07-11",
              "2020-07-12",
              "2020-07-13",
              "2020-07-14",
              "2020-07-15",
              "2020-07-16",
              "2020-07-17",
              "2020-07-18",
              "2020-07-19",
            ],
            colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 100%)"],
            legend: {
              show: false,
            },
            point: {
              show: false,
            },
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("sparkline-bounce-rate-1"), {
            chart: {
              type: "line",
              fontFamily: "inherit",
              height: 24,
              animations: {
                enabled: false,
              },
              sparkline: {
                enabled: true,
              },
            },
            tooltip: {
              enabled: false,
            },
            stroke: {
              width: 2,
              lineCap: "round",
            },
            series: [
              {
                color: "var(--tblr-primary)",
                data: [17, 24, 20, 10, 5, 1, 4, 18, 13],
              },
            ],
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("sparkline-bounce-rate-2"), {
            chart: {
              type: "line",
              fontFamily: "inherit",
              height: 24,
              animations: {
                enabled: false,
              },
              sparkline: {
                enabled: true,
              },
            },
            tooltip: {
              enabled: false,
            },
            stroke: {
              width: 2,
              lineCap: "round",
            },
            series: [
              {
                color: "var(--tblr-primary)",
                data: [13, 11, 19, 22, 12, 7, 14, 3, 21],
              },
            ],
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("sparkline-bounce-rate-3"), {
            chart: {
              type: "line",
              fontFamily: "inherit",
              height: 24,
              animations: {
                enabled: false,
              },
              sparkline: {
                enabled: true,
              },
            },
            tooltip: {
              enabled: false,
            },
            stroke: {
              width: 2,
              lineCap: "round",
            },
            series: [
              {
                color: "var(--tblr-primary)",
                data: [10, 13, 10, 4, 17, 3, 23, 22, 19],
              },
            ],
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("sparkline-bounce-rate-4"), {
            chart: {
              type: "line",
              fontFamily: "inherit",
              height: 24,
              animations: {
                enabled: false,
              },
              sparkline: {
                enabled: true,
              },
            },
            tooltip: {
              enabled: false,
            },
            stroke: {
              width: 2,
              lineCap: "round",
            },
            series: [
              {
                color: "var(--tblr-primary)",
                data: [6, 15, 13, 13, 5, 7, 17, 20, 19],
              },
            ],
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("sparkline-bounce-rate-5"), {
            chart: {
              type: "line",
              fontFamily: "inherit",
              height: 24,
              animations: {
                enabled: false,
              },
              sparkline: {
                enabled: true,
              },
            },
            tooltip: {
              enabled: false,
            },
            stroke: {
              width: 2,
              lineCap: "round",
            },
            series: [
              {
                color: "var(--tblr-primary)",
                data: [2, 11, 15, 14, 21, 20, 8, 23, 18, 14],
              },
            ],
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("sparkline-bounce-rate-6"), {
            chart: {
              type: "line",
              fontFamily: "inherit",
              height: 24,
              animations: {
                enabled: false,
              },
              sparkline: {
                enabled: true,
              },
            },
            tooltip: {
              enabled: false,
            },
            stroke: {
              width: 2,
              lineCap: "round",
            },
            series: [
              {
                color: "var(--tblr-primary)",
                data: [22, 12, 7, 14, 3, 21, 8, 23, 18, 14],
              },
            ],
          }).render();
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        var themeConfig = {
          theme: "light",
          "theme-base": "gray",
          "theme-font": "sans-serif",
          "theme-primary": "blue",
          "theme-radius": "1",
        };
        var url = new URL(window.location);
        var form = document.getElementById("offcanvasSettings");
        var resetButton = document.getElementById("reset-changes");
        var checkItems = function () {
          for (var key in themeConfig) {
            var value = window.localStorage["tabler-" + key] || themeConfig[key];
            if (!!value) {
              var radios = form.querySelectorAll(`[name="${key}"]`);
              if (!!radios) {
                radios.forEach((radio) => {
                  radio.checked = radio.value === value;
                });
              }
            }
          }
        };
        form.addEventListener("change", function (event) {
          var target = event.target,
            name = target.name,
            value = target.value;
          for (var key in themeConfig) {
            if (name === key) {
              document.documentElement.setAttribute("data-bs-" + key, value);
              window.localStorage.setItem("tabler-" + key, value);
              url.searchParams.set(key, value);
            }
          }
          window.history.pushState({}, "", url);
        });
        resetButton.addEventListener("click", function () {
          for (var key in themeConfig) {
            var value = themeConfig[key];
            document.documentElement.removeAttribute("data-bs-" + key);
            window.localStorage.removeItem("tabler-" + key);
            url.searchParams.delete(key);
          }
          checkItems();
          window.history.pushState({}, "", url);
        });
        checkItems();
      });
    </script>

    
    <script src="./js/product.js"></script>
    <!-- END PAGE SCRIPTS -->

  </body>
</html>
