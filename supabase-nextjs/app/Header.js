import React from "react";
export function Header({}) {
  return (
    <header>
      <nav>
        <ul>
          <li>
            <a href="#">User Vinz</a>
          </li>
          <li class="flex-right" id="nav-logout">
            <a href="#">Logout</a>
          </li>
        </ul>
      </nav>
    </header>
  );
}
