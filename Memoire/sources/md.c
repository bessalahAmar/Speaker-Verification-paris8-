float hurst(float d) {
  return d / powf(2.0f, 2.0f * H);
}

void md(float * curve, int x0, int x1, float d) {
  int mx = (x0 + x1) / 2;
  int w_2 = (x1 - x0) / 2;
  int w_2r = w_2 + ((x1 - x0) % 2);
  d = hurst(d);
  curve[mx] = ((curve[x0] + curve[x1]) / 2.0f) + d * su_rand();
  if(w_2 > 1)
    md(curve, x0, mx, d);
  if(w_2r > 1)
    md(curve, mx, x1, d);
}
