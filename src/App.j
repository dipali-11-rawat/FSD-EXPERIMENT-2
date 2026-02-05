import React, { useState } from "react";
import {
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Drawer,
  List,
  ListItem,
  ListItemText,
  Container,
  Grid,
  Card,
  CardContent,
  Button,
  Switch,
  CssBaseline
} from "@mui/material";
import MenuIcon from "@mui/icons-material/Menu";
import { ThemeProvider, createTheme } from "@mui/material/styles";

function App() {
  const [darkMode, setDarkMode] = useState(false);
  const [open, setOpen] = useState(false);

  const theme = createTheme({
    palette: {
      mode: darkMode ? "dark" : "light",
      primary: { main: "#1976d2" }
    }
  });

  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />

      {/* Top Navigation Bar */}
      <AppBar position="static">
        <Toolbar>
          <IconButton color="inherit" onClick={() => setOpen(true)}>
            <MenuIcon />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Admin Dashboard
          </Typography>
          <Switch
            checked={darkMode}
            onChange={() => setDarkMode(!darkMode)}
          />
        </Toolbar>
      </AppBar>

      {/* Sidebar */}
      <Drawer open={open} onClose={() => setOpen(false)}>
        <List sx={{ width: 240 }}>
          {["Home", "Dashboard", "Settings"].map((text) => (
            <ListItem button key={text}>
              <ListItemText primary={text} />
            </ListItem>
          ))}
        </List>
      </Drawer>

      {/* Landing Page */}
      <Container sx={{ mt: 4 }}>
        <Grid container spacing={4}>
          <Grid item xs={12} md={6}>
            <Typography variant="h4">
              Responsive Landing Page
            </Typography>
            <Typography sx={{ mt: 2 }}>
              This layout stacks on mobile devices and appears
              side-by-side on larger screens using Material UI Grid.
            </Typography>
            <Button variant="contained" sx={{ mt: 2 }}>
              Get Started
            </Button>
          </Grid>

          <Grid item xs={12} md={6}>
            <Card>
              <CardContent>
                <Typography variant="h6">
                  Material UI Components
                </Typography>
                <Typography>
                  Clean, modern and fully responsive UI.
                </Typography>
              </CardContent>
            </Card>
          </Grid>
        </Grid>

        {/* Dashboard Cards */}
        <Typography variant="h5" sx={{ mt: 5, mb: 2 }}>
          Dashboard Overview
        </Typography>

        <Grid container spacing={3}>
          {[1, 2, 3, 4].map((item) => (
            <Grid item xs={12} sm={6} md={3} key={item}>
              <Card>
                <CardContent>
                  <Typography variant="h6">
                    Card {item}
                  </Typography>
                  <Typography>
                    Responsive dashboard card.
                  </Typography>
                </CardContent>
              </Card>
            </Grid>
          ))}
        </Grid>
      </Container>
    </ThemeProvider>
  );
}

export default App;
